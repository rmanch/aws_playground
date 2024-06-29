
if [[ $1 != "deploy" && $1 != "delete" && $1 != "preview" ]]; then
    echo "ERROR: Incorrect execution mode. Valid values: deploy, delete, preview." >&2
    exit 1
fi


if [ "$1" = "deploy" ]
then
   aws cloudformation deploy \
      --stack-name $2 \
      --template-file $3 \
      --parameter-overrides file://$4 \
      --capabilities "CAPABILITY_NAMED_IAM"  \
      --region $5
else 
   if [ "$1" = "preview" ]
   then 
      echo "preview"
      aws cloudformation deploy \
         --stack-name $2 \
         --template-file $3 \
         --parameter-overrides file://$4 \
         --capabilities "CAPABILITY_NAMED_IAM"  \
         --region $5 \
         --no-execute-changeset
   else
      if [ "$1" = "delete" ]
      then 
         aws cloudformation delete-stack \
            --stack-name $2 \
            --region $3
      fi
   fi
fi