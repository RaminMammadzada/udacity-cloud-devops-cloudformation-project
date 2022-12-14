aws s3 cp ../staticContents/index.html s3://udacity-clouddevops-course2-project && \

aws cloudformation create-stack \
--stack-name $1 \
--template-body file://$2 \
--parameters file://$3 \
--capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
--region=eu-central-1
