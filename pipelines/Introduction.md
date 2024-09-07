# CI/CD pipelines

Pipelines are the top-level component of continuous integration, delivery, and deployment.

## Pipelines comprises

Jobs, which define what to do. For example, jobs that compile or test code.
Stages, which define when to run the jobs. For example, stages that run tests after stages that compile the code.
Jobs are executed by runners. Multiple jobs in the same stage are executed in parallel, if there are enough concurrent runners.

*If all jobs in a stage succeed, the pipeline moves on to the next stage.*

*If any job in a stage fails, the next stage is not (usually) executed and the pipeline ends early.*

In general, pipelines are executed automatically and require no intervention once created. However, there are also times when you can manually interact with a pipeline.

## A typical pipeline might consist of four stages, executed in the following order

- A build stage, with a job called compile.
- A test stage, with two jobs called test1 and test2.
- A staging stage, with a job called deploy-to-stage.
- A production stage, with a job called deploy-to-prod.
