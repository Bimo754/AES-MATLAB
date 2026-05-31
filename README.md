# AES-MATLAB

A professional, high-performance cryptography suite implemented in MATLAB. This application provides an AES-inspired text encryption and decryption pipeline with a modern, programmatic GUI.

## Key Features
*   **100% Programmatic GUI:** Self-contained architecture with no binary `.fig` file dependencies.
*   **Modern Aesthetic:** High-contrast "Cyberpunk" dark mode theme.
*   **Performance Optimized:** Fully vectorized matrix operations for maximum efficiency.
*   **Robust Cryptography:** Implements ShiftRows, MixColumns, and AddRoundKey transformations.
*   **Smart Clipboard:** Integrated Copy/Clear utilities with automatic MATLAB array formatting.

## Project Structure
*   **`AES.m`**: Main entry point and programmatic UI driver.
*   **`gen_key.m`**: High-level cryptographic key derivation.
*   **`ENCRYPT/`**: Modular encryption pipeline.
    *   `encrypt_data.m`: Main encryption driver.
    *   `add_key.m`: Vectorized key addition.
    *   `mix_col.m`: Optimized column-wise multiplication.
    *   `shift_row.m`: Built-in circular shifting.
    *   `convert_sq.m`: Data-to-matrix transformation with padding.
*   **`DECRYPT/`**: Modular decryption pipeline.
    *   `decrypt_data.m`: Main decryption driver.
    *   `remove_key.m`: Vectorized key removal.
    *   `rev_mix_col.m`: Optimized column-wise division.
    *   `rev_shift_row.m`: Built-in circular shifting.
    *   `convert_line.m`: Matrix-to-data transformation.

## Technical Implementation

### The Pipeline
The encryption process follows a systematic flow:
1.  **Normalization:** Text is converted to ASCII integers and reshaped into a square matrix.
2.  **Key Expansion:** A polynomial key is derived from the user password, ensuring non-zero digits to prevent information loss.
3.  **Transformation Rounds:** Data undergoes `N` repetitions of:
    *   **ShiftRows**: Row-wise cyclic shifts.
    *   **MixColumns**: Column mixing via element-wise multiplication with the polynomial key.
    *   **AddRoundKey**: Scalar matrix addition with the derived key.

### Performance
The implementation leverages MATLAB's internal optimizations by using vectorized operations instead of nested loops. Transformations like `ShiftRows` utilize the built-in `circshift` function, ensuring high-speed data processing even for large datasets.

## How to Use
1.  Open MATLAB and navigate to the project directory.
2.  Type `AES` in the Command Window to launch the GUI.
3.  **Encrypt**: Enter your text, set a password (min 4 characters), and click **ENCRYPT**.
4.  **Decrypt**: Paste the encrypted numeric matrix into the input field, enter the same password and repetitions, and click **DECRYPT**.
5.  **Utilities**: Use the **COPY** button to format numeric results for immediate re-input, and **CLEAR** to reset the output window.
