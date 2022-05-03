@echo off

IF "-n" "%INPUT_AWS_S3_ENDPOINT%" (
  SET ENDPOINT_APPEND="--endpoint-url %INPUT_AWS_S3_ENDPOINT%"
)
aws "configure" "--profile" "s3-cp-action" 2>&1
${INPUT_AWS_SECRET_ACCESS_KEY}
${INPUT_AWS_REGION}
GOTO :EOF
cmd /c "aws s3 cp %INPUT_SOURCE% %INPUT_DEST% \
              --profile s3-cp-action \
              --no-progress \
              %ENDPOINT_APPEND% %INPUT_FLAGS% %*%"
aws "configure" "--profile" "s3-cp-action"  2>&1

GOTO :EOF