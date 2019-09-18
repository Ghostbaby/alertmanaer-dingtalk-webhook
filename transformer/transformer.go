package transformer

import (
	"bytes"
	"fmt"

	"github.com/ghostbaby/alertmanaer-dingtalk-webhook/model"
)

// TransformToMarkdown transform alertmanager notification to dingtalk markdow message
func TransformToMarkdown(notification model.Notification) (markdown *model.DingTalkMarkdown, robotURL string, err error) {

	//groupKey := notification.GroupKey
	status := notification.Status

	annotations := notification.CommonAnnotations
	robotURL = annotations["dingtalkRobot"]

	var buffer bytes.Buffer

	if status == "firing" {
		buffer.WriteString(fmt.Sprintf("## 当前状态:%s \n", "告警"))
	}else {
		buffer.WriteString(fmt.Sprintf("## 当前状态:%s \n", "恢复"))
	}



	//buffer.WriteString(fmt.Sprintf("### 告警项:\n"))

	for _, alert := range notification.Alerts {
		annotations := alert.Annotations
		buffer.WriteString(fmt.Sprintln("**==========================**\n\n"))
		buffer.WriteString(fmt.Sprintf("#### %s\n\n", alert.Labels["alertname"]))
		buffer.WriteString(fmt.Sprintf("> %s\n\n",  annotations["description"]))
		buffer.WriteString(fmt.Sprintf("> 开始时间：%s\n\n", alert.StartsAt.Local().Format("15:04:05")))
	}

	markdown = &model.DingTalkMarkdown{
		MsgType: "markdown",
		Markdown: &model.Markdown{
			Title: fmt.Sprintf("当前状态:%s \n", status),
			Text:  buffer.String(),
		},
		At: &model.At{
			IsAtAll: false,
		},
	}

	return
}
