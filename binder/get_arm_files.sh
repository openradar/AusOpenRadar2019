# ARM Live Data Webservice file retrieval helper script.
# Version: 1.7
# Contact: Ranjeet Devarakonda zzr@ornl.gov, Michael Crow crowmc@ornl.gov

# Usage:
# ./getFiles.sh USER DS START [END]

case $# in
    3) US=$1
       DS=$2
       START=$3
       END=""
       ;;
    4) US=$1
       DS=$2
       START=$3
       END="&end=$4"
       ;;
    0|1|2|*) echo -e "Usage:\n$0 USER:TOKEN DS START [END]"
       exit
       ;;
esac

OUT=$(curl -k "https://adc.arm.gov/armlive/livedata/query?user=${US}&ds=${DS}&start=${START}${END}&wt=json")

if echo ${OUT} | grep success >/dev/null
then
    # Remove any special characters
    DS=$(echo ${DS} | tr -cd "[:alnum:]")

    # Make directory to organize downloads
    if [ ! -d ${DS} ]; then mkdir ${DS}; fi

    # Parse JSON to iterable items
    OUT=$(echo ${OUT} | cut -d '[' -f 2 | cut -d ']' -f 1 | sed 's/,/ /g')
    for i in ${OUT}
    do
        # Trim away all but the file name
        i=$(echo $i | tr -d '"' | tr -d " ")

        # Download the file via web service
        curl -k "https://adc.arm.gov/armlive/livedata/saveData?user=${US}&file=$i" > ${DS}/$i
    done
fi
