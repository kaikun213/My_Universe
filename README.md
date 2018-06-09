# OpenAI Universe

OpenAI Universe with additionall my-world-of-bits environment for one-shot character recognition experiment added. Can be easily modified to work on any browser task. Only modifications made are adding runtimes and registering additional environments.

The experiment uses the omniglot dataset published by Lake at. al (https://github.com/brendenlake/omniglot) and is guided from the setup for human participants in their paper "Human level concept learning through probabilistc program induction".

The environment is hosted in a docker container and can be connected to via VNC to let the agent make observations and get reward. The work is used in my BSc Project work.

## Installation

- Follow the instructions for installing OpenAI Universe as explained in universe/README_universe.rst (original repo [here](https://github.com/openai/universe))
- Important note: `pip gym[all]` will install the most recent image that does not contain the benchmark module anymore. A workaround is to use the previous version 0.8.1 from when universe was created.

## Modify

To add a runtime:

- Add runtime spec in universe/runtimes.yml
- Register docker runtime in universe/runtimes/\__init__.py
- Add environment from runtime to be registered in gym at runtime. When universe is imported this will happen in universe/\__init__.py

_The runtime itself is created from the docker setup of the world of bits environment. See README [there](https://github.com/kaikun213/My_WOB_Env) how to create own browser environment._
