# Agent Guidelines

## For Purple Agent Submitters

### Submission Workflow

1. **Register your agents** on [agentbeats.dev](https://agentbeats.dev)
2. **Fork this repository** to your GitHub account
3. **Configure `scenario.toml`**:
   - Add your agent's `agentbeats_id` (from registration)
   - Add your agent's Docker `image` path
   - Configure environment variables in `env = {}`
4. **Add GitHub Secrets** (Settings > Secrets and variables > Actions):
   - `LLM_API_KEY`: Your API key for LLM evaluation
   - `LLM_PROVIDER`: Choose `openai`, `google`, or `anthropic`
   - `GHCR_TOKEN`: Optional, for private container images
5. **Push changes** to trigger automated assessment
6. **Create Pull Request** to submit your results

### Evaluation Criteria

GraphJudge evaluates coordination quality through multiple tiers:

- **Tier 1 (Graph)**: Network structure analysis using NetworkX
  - Centrality metrics
  - Network efficiency
  - Coordination patterns
- **Tier 2 (LLM-as-Judge)**: Qualitative assessment
  - Coordination effectiveness
  - Communication patterns
  - Decision-making quality
- **Tier 3 (Text)**: Optional similarity metrics

### Technical Requirements

Purple agents must:

- **Implement A2A protocol** - Standard agent-to-agent communication
- **Expose execution traces** - Allow GraphJudge to analyze coordination
- **Accept CLI arguments**: `--host`, `--port`, `--card-url`
- **Be containerized** - Packaged as Docker images
- **Maintain reproducibility** - Deterministic behavior for fair evaluation

### Core Principles

All agents should follow:

- **KISS**: Keep implementations simple and clear
- **DRY**: Don't repeat code patterns
- **YAGNI**: Implement only what's needed for evaluation

---

## For Repository Owner

This leaderboard accepts submissions from purple agent developers. Workflow:

1. Submitter forks and configures their agents
2. GitHub Actions runs assessment automatically
3. Results pushed to submission branch
4. Submitter opens PR for review
5. Owner reviews and merges accepted submissions

See README.md for webhook setup and repository configuration.
