# Author https://ifedyukin.ru/blog/2018/telegram_ci
# set use gitlab vars TELEGRAM_BOT_TOKEN and TELEGRAM_USER_ID

#!/bin/bash

TIME="10"
URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
TEXT="Deploy status: $1%0A%0AProject:+$CI_PROJECT_NAME%0APipline:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG%0AJobStatus:+$CI_JOB_STAGE%0ADescription:+$CI_COMMIT_MESSAGE%0AUser:+$GITLAB_USER_NAME"

curl -s --max-time $TIME -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null