# fuchsia-docker
Docker image with fuchsia SDK

# As VSCode Devcontainer

1. Install [Dev Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

2. Create a file `.devcontainer/devcontainer.json` with the following contents:

```json
{
    "image": "asapelkin/fuchsia:latest",
    
    "remoteUser": "user",
    "customizations": {
        "vscode": {
            "extensions": [
                "BazelBuild.vscode-bazel",
                "fuchsia-authors.vscode-fuchsia"
            ]
        }
    },
    "runArgs": ["--device", "/dev/kvm", "--group-add", "108"]
}
```
3. F1 -> Reopen In Container 
4. File -> Open Workspace from file -> "/home/user/fuchsia-getting-started/getting-started.code-workspace
5. You are ready to go.

# Command line usage
```bash
sudo docker run -it --device=/dev/kvm --group-add 108 --net=host asapelkin/fuchsia:latest
```
