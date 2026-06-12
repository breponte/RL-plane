# Reinforcement Learning

This folder contains the reinforcement learning agent used to play the flight
simulator. The agent will learn how to maneuver a flight simulation to reach a target randomly placed around the plane. Some algorithms used include:

TODO
- [Proximal Policy Optimization](https://arxiv.org/abs/1707.06347)
- [Soft Actor Critic](https://arxiv.org/abs/1801.01290)
- [Twin Delayed DDPG](https://arxiv.org/pdf/1802.09477)

Other areas of potential development would be to include
[verbal reinforcement](https://web.stanford.edu/class/archive/cs/cs224n/cs224n.1254/final-reports/256847963.pdf)
by the analysis agent to improve learning.

## Training

### Setup

In order to run a training session, first specify the `RUN_ID` environment variable. This will identify the training session that will output to `/results` directory once training completes.

### Running

Once the `RUN_ID` is specified, run the Docker container with `docker compose up` while Docker Desktop is open. It might be necessary to run `docker compose build` if the Python libraries aren't installed through `docker compose up`. The agent is now ready for the Unity environment to run.

Open up the Unity environment found at https://github.com/breponte/Plane-Simulator. Click the run button at the top when the Docker container is ready and running. The agent will now begin training, reporting mean reward and standard deviation periodically.

In order to visualize the statistics of the agent's learning, run `tensorboard --logdir results` to see environment metrics, loss metrics, and policy metrics. This command is to be run on the host, so a potential separate pip install might be required.

For manual testing, go to the Unity environment's `PlaneWrapper > Behavior Parameters > Behavior Type` and set it to be `Heuristic Only`. Additionally, running the simulation without the Docker container running will default to Heuristic mode.

### Tuning

Agent tuning can be specified in `config/config.yaml`. Algorithm, hyperparameters, and imitation learning can be configured there.

Imitation learning has proven to be valuable in order to guide the agent towards expert behavior.

Outside of agent tuning in the `config.yaml` file, additional tuning can be done in the Unity `FlightAgent.cs` script. In the `OnActionReceived()` method, negative rewards can be tuned to discourage poor behavior. In the `OnCollisionEnter()` method, positive rewards can be tuned to encourage desired behavior.

## Testing

In order to visually see the agent's performance, import the `*.onnx` file found at `results/{RUN_ID}/FlightAgent.onnx`. This is the trained model and it can be uploaded to Unity Assets and selected in the Unity environment's `PlaneWrapper > Behavior Parameters > Model` and specify `PlaneWrapper > Behavior Parameters > Behavior Type` to be `Inference Only`.

## Algorithms

### Proximal Policy Optimization
TODO

### Soft Actor Critic
TODO

### Twin Delayed DDPG
TODO