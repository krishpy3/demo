#/bin/bash
instance=$(cat file.json)

while IFS= read -r line; do
    if [[ $line =~ \"Id\":\ \"(i-.+?)\" ]]; then
        # echo "${line}"
        # echo "${BASH_REMATCH[1]}"
        instance_ids+=("${BASH_REMATCH[1]}")
    fi

done <<< "$instance"

# Iterate through each instance ID and get volume information
for instance_id in "${instance_ids[@]}"; do
    # Query volumes associated with the instance ID
    instance_volumes=$(aws ec2 describe-volumes --filters Name=attachment.instance-id,Values="$instance_id" --query 'Volumes[*].{ID:VolumeId}' --output text)

    # Iterate through each volume ID and get the volume information
    while IFS= read -r volume_id; do
        # Query volume information
        volume_info=$(aws ec2 describe-volumes --volume-ids "$volume_id" --query 'Volumes[*].{ID:VolumeId,Size:Size,Type:VolumeType,State:State,Device:Attachments[0].Device}' --output text)

        # Print volume information
        echo "$volume_info"
    done <<< "$instance_volumes"
