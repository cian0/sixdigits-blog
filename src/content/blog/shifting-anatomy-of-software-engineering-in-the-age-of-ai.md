---
title: 'The Shifting Anatomy of Software Engineering Work in the Age of AI'
description: 'AI is automating the execution layer of software engineering. But the fundamental job — translating ambiguous human intent into reliable systems — was never about writing code. Here is the anatomy of what actually shifts.'
pubDate: '2026-04-10'
heroImage: '../../assets/blog-placeholder-1.jpg'
tags: ['ai', 'software-engineering', 'career', 'data-engineering']
---

## The Central Question

To understand where software engineering is going, you have to go back to why software engineers were hired in the first place — not in terms of skills or tools, but in terms of the *fundamental job they were brought in to do*. When you apply Problem Anatomy to that question, the answer becomes stark: most of what AI is now automating was never the actual job. It was the execution layer. The actual job — translating ambiguous human intent into precise, reliable, valuable systems — remains almost entirely unsolved by AI, and may be structurally unsolvable.

This post uses the Problem Anatomy + JTBD framework to trace the anatomy of what software engineers are really hired to do, map which atomic jobs AI is fully, partially, or unable to solve, analyze what shifts when execution becomes automated, and assess the long-run trajectory with intellectual honesty.

---

## Part 1: The Root-Level Anatomy — Why Software Engineers Exist

### The Real Job at the Top of the Hierarchy

Before dissecting what software engineers do day-to-day, the framework demands we ask: *what problem existed in the world that caused businesses to hire software engineers at all?*

**Symptom (surface):** "We need someone to build this feature."

**Immediate Cause:** The engineering team cannot ship fast enough without specialists.

**Root Cause:** Businesses need to convert human intent — goals, processes, problems, desires — into deterministic, executable logic that machines can perform at scale. This translation problem is the fundamental reason software engineering exists as a profession.

**Context:** Every business domain generates complexity faster than any individual or team can manage manually. Software is the systematic compression of that complexity into repeatable, automatable processes.

**Emotional/Social Job:** Organizations want confidence that systems will work reliably, be maintainable by future teams, and evolve without catastrophic failure — not just that code compiles.

**Desired Outcome:** Convert imprecise, changing human intent into precise, reliable, evolvable software systems — at acceptable cost and speed.

This is the **top-level job** of software engineering. And critically, it has six sub-problems, of which only *one* is primarily about writing code:

| # | Sub-Problem | Nature |
|---|---|---|
| 1 | Identify the correct problem to solve | Human/judgment |
| 2 | Get the right specifications to solve it | Human/collaborative |
| 3 | Distribute shared understanding of the specs | Human/social |
| 4 | Implement the specifications | Execution/technical |
| 5 | Verify correct implementation | Technical/judgment |
| 6 | Repeat in the context of evolving problems | Human/adaptive |

Problems 1, 2, 3, and 6 are explicitly identified as the hardest — and the most human. Problem 4, implementation, is the one AI is aggressively automating. The implication is profound: **AI is automating the least essential part of the job, as defined by the job's own anatomy.**

### The "Coder vs. Engineer" Distinction

This anatomy explains a distinction that has always existed but is now existentially important: the difference between a *coder* and an *engineer*.

A coder solves the problem handed to them through code. An engineer questions why the problem exists, whether it's the right problem, what the constraints are, and what the downstream consequences of different solutions will be. The JTBD framing is precise here: engineers who only execute tickets — who operate purely in Problem 4 — are hiring themselves out to do the same job AI now does better and cheaper.

Engineers who operate in Problems 1-3 and 6 — problem discovery, specification, shared understanding, iteration — are hiring themselves out to do work that AI has no reliable mechanism for.

---

## Part 2: The AI Capability Map — What Is and Isn't Solvable

### Current State: Where AI Is and Isn't

AI coding tools have achieved measurable, significant gains in execution tasks. Developers using GitHub Copilot complete tasks 55% faster. By 2026, approximately 41% of code is AI-generated or assisted. Anthropic's data shows that 79% of Claude Code conversations are classified as "automation" — the AI directly performing the task, not assisting a human. By 2027-2028, analysts project autonomous agents will handle 30-40% of development tasks end-to-end.

But on complex, realistic, long-horizon tasks, AI struggles significantly. Carnegie Mellon's TheAgentCompany study found AI agents could only complete about 30% of tasks autonomously, with complex and long-horizon work well beyond their reach. 66% of developers report that AI solutions are "almost right, but not quite" — the most common frustration, and the exact failure mode you'd predict when execution without judgment is attempted.

### Solvability Framework

The key insight from applying Problem Anatomy to AI capability is that solvability is not binary. Jobs fall into three categories based on their anatomy:

| Solvability Tier | Job Characteristics | Examples |
|---|---|---|
| **Fully Solvable (Now)** | Bounded context, clear success criteria, no ambiguity, pattern-based | Boilerplate generation, unit test writing, code completion, isolated bug fixes, linting |
| **Partially Solvable (With Human Oversight)** | Bounded context but requires judgment on edge cases or correctness | Multi-file refactoring, PR summaries, debugging known error types, API integration |
| **Structurally Not Solvable** | Requires intent interpretation, novel judgment, accountability, tacit knowledge, values alignment | Problem definition, requirements elicitation, system architecture, production ownership, stakeholder alignment |

The "structurally not solvable" category is not constrained by today's AI capability — it is constrained by the *nature of the job itself*. Problem definition requires knowing what the human *actually wants*, which is often different from what they say they want, and which changes over time. System architecture under constraints requires weighing incommensurable values — speed vs. reliability vs. cost vs. maintainability — in a specific business context that an AI has no intrinsic stake in getting right.

### The METR Trend Line: Exponential Capability Growth

METR's research found that the length of tasks AI can complete (at 50% probability) has been doubling every 7 months. This is the most important counter-argument to clean solvability categories: the "partially solvable" tier is shrinking, and the boundary of the "fully solvable" tier is advancing.

The honest answer is that **execution-layer work is fully solvable and already being solved**. The question of whether the top of the hierarchy — intent interpretation, judgment under genuine ambiguity, accountability — is solvable is genuinely open. Most current evidence suggests it requires something AI does not have: stakes.

---

## Part 3: The Three Anatomy Layers That Don't Move

When you apply the 6-layer Problem Anatomy to every atomic job in software engineering, three layers consistently resist AI automation. These are not coincidentally the layers that define the difference between a junior and senior engineer — they are structurally human.

### Layer 1: Intent Translation

Every software project begins with someone who has a need they cannot fully articulate. The job of translating "I want users to be able to see their history" into a precise, implementable specification — including all the unstated requirements, edge cases, performance constraints, and downstream implications — requires a human to hold the space between business intent and technical reality.

AI can generate code from specs. It cannot generate the *right* spec from an ambiguous human desire. The "almost right but not quite" failure mode observed by 66% of developers is this exact gap — AI executes against the literal specification but misses the intent.

### Layer 2: Judgment Under Constraint

Every significant architectural decision requires choosing between values that cannot be reduced to a single optimization target: speed vs. reliability, flexibility vs. simplicity, cost vs. performance, build vs. buy, security vs. usability. These are not optimization problems with a calculable answer. They require a human with context, experience, and accountability — someone who will own the consequences of the decision.

AI can enumerate options and model their implications. It cannot own the decision, and organizations cannot hold AI accountable for architectural choices that cause production outages two years later.

### Layer 3: Trust and Accountability

The emotional and social job of software engineering — giving organizations *confidence* that their systems are reliable, maintainable, and evolving correctly — requires a human agent who bears professional accountability. This is not reducible to test coverage percentages. It is the social contract between an engineer and the organization that deployed their work.

This layer is why "AI won't replace software engineers" is not purely optimistic spin — it's structurally accurate for anyone operating above pure execution. Organizations cannot sue, fire, or promote an AI. The accountability chain collapses without humans who own outcomes.

---

## Part 4: The Jevons Paradox Effect — More Automation, More Demand

The first-order intuition is: if AI automates 40-55% of execution tasks, 40-55% fewer engineers are needed. History consistently contradicts this model.

The **Jevons Paradox** — where greater efficiency in using a resource leads to *higher* overall consumption of that resource, not lower — has played out repeatedly in software:

- When cloud computing made infrastructure cheap → DevOps and SRE demand exploded, not collapsed
- When ATMs automated bank teller transactions → banks hired *more* tellers (cheaper banking → more branches → more customer interactions)
- When shipping containers reduced logistics cost 90% → global trade volume grew orders of magnitude

In software specifically: as AI lowers the cost of building software, the universe of problems worth solving with software expands. Products that were too expensive to build become viable. Markets that couldn't afford custom software can now afford it. The demand surface for software explodes — and someone needs to do Problems 1, 2, 3, and 6 for all of it.

**The important caveat:** Jevons Paradox expands total demand for the *category* — it does not protect every *sub-type* within that category. Entry-level tech hiring collapsed 73.4% year-over-year while AI/ML hiring grew 88%. Federal projections show software developer jobs growing 15% 2024-2034, but most of that growth accrues to senior roles that operate in the non-automatable layers.

---

## Part 5: The Hollowed Career Ladder — The Real Risk

The most dangerous near-term consequence of AI automation in software engineering is not mass unemployment — it is the hollowing of the career pipeline.

Junior developers have historically been hired to do execution work: build features from specs, write tests, fix bugs, maintain existing systems. These are exactly the jobs AI is absorbing. As a result, entry-level tech hiring has collapsed 73.4% year-over-year. 54% of engineering leaders plan to hire fewer juniors.

The problem: senior engineers who operate in the judgment layer didn't get there without first doing years of execution work. The execution layer isn't just output — it's *training data for humans*. Debugging real bugs is how engineers develop the intuition for system behavior. Writing real tests is how engineers develop the instinct for correctness. Reviewing real PRs is how junior engineers internalize architectural patterns.

If the execution layer is removed before the pipeline of junior-to-senior development is replaced by an alternative training model, the supply of senior judgment-layer engineers will tighten severely in 5-10 years. The "broken rung" in the career ladder is not just a career problem — it's a future talent risk for organizations that depend on experienced engineers to own complex systems.

---

## Part 6: The New Job Map for Software Engineers

As the anatomy shifts, the Job Map for a software engineer in an AI-native environment looks fundamentally different. The steps remain the same, but the *human contribution* at each step inverts.

| Job Map Step | Pre-AI Human Contribution | Post-AI Human Contribution |
|---|---|---|
| **Define** | Understand the task | Understand the *right* task — problem anatomy, intent extraction, scope definition |
| **Locate** | Find relevant code, docs, patterns | Validate that AI-found patterns apply in this specific context |
| **Prepare** | Set up boilerplate, environments | Specify constraints for AI generation; define what "good" looks like |
| **Confirm** | Write tests, check logic | Verify AI output is correct *for this context*, not just syntactically valid |
| **Execute** | Write code | Delegate to AI; review and steer |
| **Monitor** | Watch for bugs and failures | Design observability systems; evaluate AI-generated systems for systemic risk |
| **Modify** | Fix bugs, refactor | Evaluate AI-suggested fixes for downstream consequences |
| **Conclude** | Document, clean up | Ensure AI-generated artifacts are explainable and maintainable by future humans |

The shift is from *doing* most steps to *specifying and verifying* most steps. The job becomes less like building a house yourself and more like being the architect who directs skilled AI workers — where the quality of the house depends entirely on how precisely and intelligently the architect specified the job.

### The Emerging Role Archetypes

Three distinct archetypes are emerging from this shift:

**The System Orchestrator** — Designs systems of AI agents and services working together. Owns architecture, integration, observability, and failure modes. Operates entirely in Problems 1-3 and 6.

**The AI Output Auditor** — Specializes in verifying correctness, security, and maintainability of AI-generated code at scale. The new QA/code review role that is more consequential than ever because the volume of code to review has exploded.

**The Domain-Embedded Engineer** — Combines deep business domain knowledge with technical fluency. Can translate between human intent and technical specification better than either a pure domain expert or a pure engineer. This is the "healthcare + CS" or "finance + CS" hybrid increasingly in demand.

---

## Conclusion

The Problem Anatomy of software engineering reveals that the profession was never primarily about coding — it was about translating ambiguous human intent into precise, reliable, evolving systems. AI is rapidly solving the translation's execution layer (Problem 4) while leaving the definition, specification, alignment, and iteration layers (Problems 1-3, 6) largely untouched.

The resulting shift is not "fewer engineers" in the aggregate — the Jevons Paradox effect and the expanding universe of problems worth solving with software will likely sustain or grow total demand. But the shift is profoundly redistributive: demand for execution-layer work collapses while demand for judgment-layer work intensifies. Entry-level roles are being hollowed out, creating a dangerous pipeline risk. Senior roles that operate in problem definition and system judgment are becoming more valuable than ever.

The anatomy framework gives a precise answer to "what shifts when AI solves the atomic jobs": the job doesn't disappear. It evolves upward. The lowest-anatomy layer gets automated, and the next layer up becomes the new floor. In software engineering, that new floor is the ability to understand problems well enough to specify them precisely for AI — and to verify that AI's outputs are correct in the specific, messy, politically-charged context of a real organization. That is the durable job. And it has always been the real one.
