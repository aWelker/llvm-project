//===- Transforms.h - AVX512 Dialect Transformation Entrypoints -*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef MLIR_DIALECT_AVX512_TRANSFORMS_H
#define MLIR_DIALECT_AVX512_TRANSFORMS_H

namespace mlir {

class LLVMConversionTarget;
class LLVMTypeConverter;
class OwningRewritePatternList;

/// Collect a set of patterns to lower AVX512 ops to ops that map to LLVM
/// intrinsics.
void populateAVX512LegalizeForLLVMExportPatterns(
    LLVMTypeConverter &converter, OwningRewritePatternList &patterns);

/// Configure the target to support lowering AVX512 ops to ops that map to LLVM
/// intrinsics.
void configureAVX512LegalizeForExportTarget(LLVMConversionTarget &target);

} // namespace mlir

#endif // MLIR_DIALECT_AVX512_TRANSFORMS_H