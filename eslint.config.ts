import { base, recommended } from "@mwlica/eslint";
import tseslint from "typescript-eslint";

export default tseslint.config(
    base,
    recommended
);