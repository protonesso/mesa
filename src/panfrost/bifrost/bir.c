/*
 * Copyright (C) 2020 Collabora Ltd.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice (including the next
 * paragraph) shall be included in all copies or substantial portions of the
 * Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 * Authors (Collabora):
 *      Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
 */

#include "compiler.h"

/* Does an instruction respect outmods and source mods? Depend
 * on the types involved */

bool
bi_has_outmod(bi_instruction *ins)
{
        bool classy = bi_class_props[ins->type] & BI_MODS;
        bool floaty = nir_alu_type_get_base_type(ins->dest_type) == nir_type_float;

        return classy && floaty;
}

/* Technically we should check the source type, not the dest
 * type, but the type converting opcodes (i2f, f2i) don't
 * actually support mods so it doesn't matter. */

bool
bi_has_source_mods(bi_instruction *ins)
{
        return bi_has_outmod(ins);
}

/* A source is swizzled if the op is swizzlable, in 8-bit or
 * 16-bit mode, and the swizzled op. TODO: multi args */

bool
bi_is_src_swizzled(bi_instruction *ins, unsigned s)
{
        bool classy = bi_class_props[ins->type] & BI_SWIZZLABLE;
        bool small = nir_alu_type_get_type_size(ins->dest_type) < 32;
        bool first = (s == 0); /* TODO: prop? */

        return classy && small && first;
}
