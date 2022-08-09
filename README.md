# 📝 collection of dockerfiles

---

## How to Publish a Docker Image

- after create docker_image_name repository in dockerhub

```bash
docker login

docker tag [docker_image_name]:[tag_name1] [dockerhub_id]/[docker_image_name]:[tag_name2]

docker push [dockerhub_id]/[docker_image_name]:[tag_name2]

# tag_name1 and tag_name2 can be different
```
