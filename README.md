# Observability Stack

This repository contains the stack used for observability in this company. It alson contains
`Grafana` configuration and dashboards used in production. Please refer to this repository 
if you have to add a dashboard or instrument your service.

**Note:** You can use services configured this `docker compose` pre configured to run the intrumentation of your serivce against it.

Services are:
| Service | Ports | Used For |
|---------|-------|----------|
| Open telemetry `otlp` exporter (`otel exporter`) | 14278: metrics and traces endpoint | Push your metrics and traces and route them to the destination services |
| Prometheus | 9090: Http console | Metrics Service: `otel exporter` exports metrics data to it. |
| Jaeger | 16686: Http console | Trace Service: `Otel exporter` exports trace data to it. (trace pipeline in [otel configuration](./otel-collector-config.yml)) **Note:** Derived `metrics` data is pushed to `Prometheus` by `open telemetry exporter processor` |
| Grafana | 3000: Http console | Observability tool: Queries data from telemetry services and display them in dashboards and creates alerts based on defined rules. |



## !IMPORTANT: For contributors
If you are a contributor, please follow the steps below to enable `git hooks` used by this project:

- Run `make config_git_hooks` to set the `git hooks` folder to [project's git hook folder](./.githooks). 

### To commit: 
This project expects that the commit message needs to comply with semantic version commit message conventions. So it is expected that your commit messages follows the conventions described in [Semantic Version Tools Repo](https://github.com/GUILN/semver).

To do so, [commit-msg hook](./.githooks/commit-msg) will enforce this convention.

**It is impotant** to follow this convention as we use it to generate the version of the package based on `semantic version` standards: `v.major.minor.patch` according to the `semantic version commit message`, this enables any commit to be eligible for generating a new version of the package.

### To generate and publish versions of the package:
- Make sure you are in `main branch` 
- Make sure your last commit message describes and indicates the expected semantics for the version to be generated.
- Run `make new_version`

### **!NOTE: If it is the first time you are pushing to this repo**.
You need to create the first version:
- Run `git tag -a v0.0.1 -m "first version"`
- Run `git push origin --tags v0.0.1`

**This steps will make this version available for the users.**