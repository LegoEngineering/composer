(cat > composer.sh; chmod +x composer.sh; exec bash composer.sh)
#!/bin/bash
set -ev

# Get the current directory.
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Get the full path to this script.
SOURCE="${DIR}/composer.sh"

# Create a work directory for extracting files into.
WORKDIR="$(pwd)/composer-data"
rm -rf "${WORKDIR}" && mkdir -p "${WORKDIR}"
cd "${WORKDIR}"

# Find the PAYLOAD: marker in this script.
PAYLOAD_LINE=$(grep -a -n '^PAYLOAD:$' "${SOURCE}" | cut -d ':' -f 1)
echo PAYLOAD_LINE=${PAYLOAD_LINE}

# Find and extract the payload in this script.
PAYLOAD_START=$((PAYLOAD_LINE + 1))
echo PAYLOAD_START=${PAYLOAD_START}
tail -n +${PAYLOAD_START} "${SOURCE}" | tar -xzf -

# Pull the latest Docker images from Docker Hub.
docker-compose pull
docker pull hyperledger/fabric-baseimage:x86_64-0.1.0
docker tag hyperledger/fabric-baseimage:x86_64-0.1.0 hyperledger/fabric-baseimage:latest

# Kill and remove any running Docker containers.
docker-compose -p composer kill
docker-compose -p composer down --remove-orphans

# Kill any other Docker containers.
docker ps -aq | xargs docker rm -f

# Start all Docker containers.
docker-compose -p composer up -d

# Wait for the Docker containers to start and initialize.
sleep 10

# Open the playground in a web browser.
case "$(uname)" in 
"Darwin")   open http://localhost:8080
            ;;
"Linux")    if [ -n "$BROWSER" ] ; then
	       	        $BROWSER http://localhost:8080
	        elif    which xdg-open > /dev/null ; then
	                 xdg-open http://localhost:8080
	        elif  	which gnome-open > /dev/null ; then
	                gnome-open http://localhost:8080
                       #elif other types bla bla
	        else   
		            echo "Could not detect web browser to use - please launch Composer Playground URL using your chosen browser ie: <browser executable name> http://localhost:8080 or set your BROWSER variable to the browser launcher in your PATH"
	        fi
            ;;
*)          echo "Playground not launched - this OS is currently not supported "
            ;;
esac

# Exit; this is required as the payload immediately follows.
exit 0
PAYLOAD:
� ==/Y �[o�0�yxᥐ�д��$
)E%��OQH\𚛜K˦~��)���u��M����圿��s��:��Џ�v���xwx�$��]����w�(�|CA�D��J^�	�e��J�4Nl@#�v��Ӻ���)�1
4�ͳ�90�� �">�9� ��k(��6�؃�b��^a�ʧ+ɒzm�#u�v�a��c>:
q�L@�.���L/����0�a�DSez�膾ZÁ5 ?e6�V�Q?�)�e�m};p�B�ĞE�k1G�7E��h�V�&P�P�u��[���&�f�CMW�����`4��,Lm����<�u/\NI"Fsm23�i��d��2s887�Ν��ʃTm<��Ɩ�,�?R���OF}������RH�4�~�ⴆ'��[���g#e��'�]��$���d]	����#y��?}��|C��F+3�{(x(4D��
]o@��؃0�2�.��I^: �ԇ���'�����'����y�v��4pk[����ezi�-������4�P��5�Tq��n&c|�9 ����A ��7s�#�M�� ����C+�l�As~�pa�`�OP��!1�&2�۫�"��\u>�����$Ĺ�ۄ>����3�`蒬 ۋ��첸A��;d�J�[��!;����^*��=��Z��8n�U�^�K[��/6JL��X���Y� K�����|^�{!1o*���(/��?��Ň��k������_��2��`0��`0��`0��7�	�	�n (  