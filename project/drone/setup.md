# Drone
- version : 2.20.0
- image version : 2.12.1
- helm : 0.6.5
- os: rhel7 확인 필요, rhel8 이상 가능

https://artifacthub.io/packages/helm/drone/drone

# 이미지 다운로드
docker pull drone/drone:2.12.1

# 이미지 등록
docker load -i jenkins-2.414.3.tar
docker tag jenkins/jenkins:2.414.3-lts <내부레지스트리>/jenkins/jenkins:2.414.3-lts
docker push <내부레지스트리>/jenkins/jenkins:2.414.3-lts


helm repo add drone https://charts.drone.io
helm pull drone/drone --version 0.6.5
helm pull drone/drone-runner-kube --version 0.1.10


helm upgrade --install drone -n drone --create-namespace ./drone-0.6.5.tgz -f values.yaml


# drone runner의 전용 네임스페이스 생성
kubectl create namespace drone-ci
helm upgrade --install drone-runner-kube -n drone --create-namespace ./drone-runner-kube-0.1.10.tgz -f runner.values.yaml