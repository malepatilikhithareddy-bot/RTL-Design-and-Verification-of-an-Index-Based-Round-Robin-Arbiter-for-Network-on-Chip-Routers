# RTL-Design-and-Verification-of-an-Index-Based-Round-Robin-Arbiter-for-Network-on-Chip-Routers
Verilog implementation of an Index-Based Round Robin (IRR) arbiter for Network-on-Chip routers with modular RTL architecture and simulation-based verification.
# Index-Based Round Robin Arbiter (Verilog RTL)

## Overview

This project implements an **Index-Based Round Robin (IRR) Arbiter** for **Network-on-Chip (NoC) routers** using Verilog. The arbiter ensures fair allocation of shared resources among multiple requesters by granting access in a cyclic round-robin manner.

The design is inspired by the IEEE research paper:

**“Index-based Round-Robin Arbiter for NoC Routers.”**

The project demonstrates RTL design, modular hardware architecture, and simulation-based verification.

---

## Key Features

* Fair **Round Robin arbitration**
* **Modular RTL design**
* Grant index generation (`g_id`)
* Conversion of grant index to **one-hot grant signals**
* **Testbench verification**
* Fully synthesizable Verilog design

---

## Architecture

The arbiter consists of the following main blocks:

1. **Fixed Priority Arbiter**
   Determines the first active request based on the current priority pointer.

2. **Priority Register**
   Stores the previously granted request index.

3. **Incrementer**
   Updates the priority for the next arbitration cycle.

4. **Decoder**
   Converts the grant index (`g_id`) into one-hot grant signals.

### Block Diagram

```
Requests
   │
   ▼
+-----------------------+
| Fixed Priority Arbiter|
+-----------+-----------+
            │
            ▼
        Grant Index
          (g_id)
            │
   +--------+---------+
   │                  │
   ▼                  ▼
Decoder          Incrementer
   │                  │
   ▼                  ▼
 Grant Signals   Next Priority
                       │
                       ▼
                Priority Register
                       │
                       └── Feedback to Arbiter
```

---

## Project Structure

```
irr-arbiter-verilog
│
├── rtl
│   ├── irr_arbiter_top.v
│   ├── fixed_priority_arbiter.v
│   ├── priority_reg.v
│   ├── incrementer.v
│   └── decoder.v
│
├── tb
│   └── tb_irr_arbiter.v
│
├── docs
│   ├── architecture.png
│   └── waveform.png
│
├── paper
│   └── irr_arbiter_paper.pdf
│
└── README.md
```

---

## RTL Modules

### irr_arbiter_top.v

Top-level module connecting all submodules.

### fixed_priority_arbiter.v

Selects the first active request starting from the current priority.

### priority_reg.v

Stores the last granted request index.

### incrementer.v

Updates the priority pointer for the next arbitration cycle.

### decoder.v

Converts the grant index (`g_id`) into a one-hot grant vector.

---

## Simulation

The design is verified using a **Verilog testbench**.

Test scenarios include:

* Multiple simultaneous requests
* Alternating requests
* Single active request
* No request condition

Example request patterns used in simulation:

```
1111
0101
0011
1000
0000
```

Expected round-robin grant behavior:

```
Request : 1111
Grant   : 0001 → 0010 → 0100 → 1000
```

This confirms fair arbitration among all requesters.

---

## How to Run Simulation

Using **Vivado / ModelSim / QuestaSim**

1. Add RTL files to the project
2. Add the testbench file
3. Run simulation
4. Observe waveform for `request`, `grant`, and `g_id`

---

## Applications

Round Robin arbiters are widely used in:

* Network-on-Chip (NoC) routers
* Bus arbitration
* Memory access scheduling
* Shared resource allocation in System-on-Chip (SoC) architectures

---

## Results

Simulation confirms:

* Correct **round robin priority rotation**
* Fair arbitration among active requests
* Correct generation of **grant index and grant signals**

---

## Author

Likhitha Reddy. M

Focus Areas:

* RTL Design
* Computer Architecture
* Verilog / SystemVerilog
* Network-on-Chip Architectures
