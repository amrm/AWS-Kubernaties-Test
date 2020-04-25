
# Installing AWS CLI Using APT Package Manager:
    $ sudo apt-get update
    $ sudo apt-get install awscli
    $ aws --version
    
# how create AWS Access Key ID    
# https://aws.amazon.com/blogs/security/wheres-my-secret-access-key/
    -- create IAM user
    -- give him permission
    -- go to security credentails tab will find access keys
    -- you can find also console password > click on (manage) > then choose custom password then write user password, you can force him to reset it

# Login to AWS Account Using AWS CLI:
    $ aws configure
    -- write Access key ID,Secret access key
    -- default region such us-east-2
    -- defaukt output formate json
        -- notes you must configure the above data with root user who create cluster if you create user then using the data user in configure will throw exception
            -- download rootkey.csv
    
# create kubectl config for amazon EKS
https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html
   
    $ aws sts get-caller-identity
    $ aws eks --region region-code update-kubeconfig --name cluster_name
        -- if you find error eks option is not available
        -- you will need to upgrade aws version by the below command
        -- https://stackoverflow.com/questions/51552183/eks-option-is-not-available-in-aws-cli-how-to-install-it
        $ pip3 install --upgrade --user awscli
        $ aws --version
        $ aws eks --region us-east-2 update-kubeconfig --name Reports
    $ kubectl get svc
    $ kubectl apply -f deployment.yaml
    $ kubectl get pods
    $ kubectl describe pod -podname
    $ kubectl get events --all-namespaces
    $ kubectl get nodes --all-namespaces
    -- if you found no resource found, so you will need to add node groups to your cluster 
        $ kubectl delete all -l app=aws-kbs-test
        $ kubectl apply -f deployment.yaml
    $ kubectl create clusterrolebinding cluster-system-anonymous --clusterrole=cluster-admin --user=system:anonymous








