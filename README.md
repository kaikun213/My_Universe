# OpenAI Universe

Added my-world-of-bits environment with a one-shot character recognition experimental setup. 
The experiment uses the omniglot dataset published by Lake at. al (https://github.com/brendenlake/omniglot) and is guided from the setup for human participants in their paper "Human level concept learning through probabilistc program induction".

The environment is hosted in a docker container and can be connected to via VNC to let the agent make observations and get reward. The work is used in my BSc Project work.

Created:

- Register docker runtime in universe/runtimes/__init__.py
- Add environment from runtime to be registered in gym at runtime. When universe is imported this will happen in universe/__init__.py

The runtime is created from the docker file of the world of bits environment. See README there how to create own browser environment.
