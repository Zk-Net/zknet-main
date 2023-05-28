# ZkNet Main

ZkNet is L2 solution built on top of the ZkEVM polygon.

## How to run

For running ZkNet you need to have installed docker and docker-compose.

1. Clone the repo
2. Copy `.env.example` to `.env` and fill it with your values
4. Create `./data` folder in the root of the repo
5. Create pooldb folder and also statedb folder in the `./data` folder
6. Configure folders in `.env` file
7. Run `sudo make up` in the root of the repo to start the network