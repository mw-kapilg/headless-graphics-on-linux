# signal-utils

Small MATLAB utilities for unit conversion and signal smoothing, plus
plotting and a small summary window.

- `src/` — library functions, `plotSignal` (plots and exports images), and
  `showSummary` (summary window)
- `tests/` — unit tests (MATLAB unit testing framework)

Run the tests locally from the repository root:

```matlab
addpath("src")
results = runtests("tests")
```
