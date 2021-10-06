aws ec2 describe-instances --filters "Name=tag:Name,Values=frontend" | jq .Reservations[].Instances[].State.Name | grep running &>/dev/null


aws ec2 describe-instances --filters "Name=tag:Name,Values=frontend" | jq .Instances[]