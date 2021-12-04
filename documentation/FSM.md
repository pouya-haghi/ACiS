# Loops

## Different types of entries in the state table:
1. init
- Write to cmp registers
- write the address of current `state_table + 1` to label registers (so that I can jump again)
- increment smart_ptr

2. Body+check_end
- `if sc == #sc-1`
  - `if check_end == 1`
    - reset current itr
    - increment smart_ptr
  - `else`
    - `if level == 0`
      - increment current itr_i
    - `else if level == 1`
      - jmp smart_ptr to label_j
      - increment itr_j
    - `else //level == 2`
      - jmp smart_ptr to label_k
      - increment itr_k
- `else`
  - increment smart_ptr
3. invalid
- `done = 1`
