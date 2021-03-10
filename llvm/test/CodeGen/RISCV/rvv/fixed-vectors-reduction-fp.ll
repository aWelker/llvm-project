; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -target-abi=ilp32d -mattr=+experimental-v,+experimental-zfh,+f,+d -verify-machineinstrs -riscv-v-vector-bits-min=128 -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK
; RUN: llc -mtriple=riscv64 -target-abi=lp64d -mattr=+experimental-v,+experimental-zfh,+f,+d -verify-machineinstrs -riscv-v-vector-bits-min=128  -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK

declare half @llvm.vector.reduce.fadd.v1f16(half, <1 x half>)

define half @vreduce_fadd_v1f16(<1 x half>* %x, half %s) {
; CHECK-LABEL: vreduce_fadd_v1f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    flh ft0, 0(a0)
; CHECK-NEXT:    fadd.h fa0, fa0, ft0
; CHECK-NEXT:    ret
  %v = load <1 x half>, <1 x half>* %x
  %red = call reassoc half @llvm.vector.reduce.fadd.v1f16(half %s, <1 x half> %v)
  ret half %red
}

define half @vreduce_ord_fadd_v1f16(<1 x half>* %x, half %s) {
; CHECK-LABEL: vreduce_ord_fadd_v1f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    flh ft0, 0(a0)
; CHECK-NEXT:    fadd.h fa0, fa0, ft0
; CHECK-NEXT:    ret
  %v = load <1 x half>, <1 x half>* %x
  %red = call half @llvm.vector.reduce.fadd.v1f16(half %s, <1 x half> %v)
  ret half %red
}

declare half @llvm.vector.reduce.fadd.v2f16(half, <2 x half>)

define half @vreduce_fadd_v2f16(<2 x half>* %x, half %s) {
; CHECK-LABEL: vreduce_fadd_v2f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 2, e16,m1,ta,mu
; CHECK-NEXT:    vle16.v v25, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e16,m1,ta,mu
; CHECK-NEXT:    vmv.v.i v26, 0
; CHECK-NEXT:    vsetivli a0, 2, e16,m1,ta,mu
; CHECK-NEXT:    vfredsum.vs v25, v25, v26
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    fadd.h fa0, fa0, ft0
; CHECK-NEXT:    ret
  %v = load <2 x half>, <2 x half>* %x
  %red = call reassoc half @llvm.vector.reduce.fadd.v2f16(half %s, <2 x half> %v)
  ret half %red
}

define half @vreduce_ord_fadd_v2f16(<2 x half>* %x, half %s) {
; CHECK-LABEL: vreduce_ord_fadd_v2f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 2, e16,m1,ta,mu
; CHECK-NEXT:    vle16.v v25, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e16,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v26, fa0
; CHECK-NEXT:    vsetivli a0, 2, e16,m1,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v25, v26
; CHECK-NEXT:    vfmv.f.s fa0, v25
; CHECK-NEXT:    ret
  %v = load <2 x half>, <2 x half>* %x
  %red = call half @llvm.vector.reduce.fadd.v2f16(half %s, <2 x half> %v)
  ret half %red
}

declare half @llvm.vector.reduce.fadd.v4f16(half, <4 x half>)

define half @vreduce_fadd_v4f16(<4 x half>* %x, half %s) {
; CHECK-LABEL: vreduce_fadd_v4f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 4, e16,m1,ta,mu
; CHECK-NEXT:    vle16.v v25, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e16,m1,ta,mu
; CHECK-NEXT:    vmv.v.i v26, 0
; CHECK-NEXT:    vsetivli a0, 4, e16,m1,ta,mu
; CHECK-NEXT:    vfredsum.vs v25, v25, v26
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    fadd.h fa0, fa0, ft0
; CHECK-NEXT:    ret
  %v = load <4 x half>, <4 x half>* %x
  %red = call reassoc half @llvm.vector.reduce.fadd.v4f16(half %s, <4 x half> %v)
  ret half %red
}

define half @vreduce_ord_fadd_v4f16(<4 x half>* %x, half %s) {
; CHECK-LABEL: vreduce_ord_fadd_v4f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 4, e16,m1,ta,mu
; CHECK-NEXT:    vle16.v v25, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e16,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v26, fa0
; CHECK-NEXT:    vsetivli a0, 4, e16,m1,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v25, v26
; CHECK-NEXT:    vfmv.f.s fa0, v25
; CHECK-NEXT:    ret
  %v = load <4 x half>, <4 x half>* %x
  %red = call half @llvm.vector.reduce.fadd.v4f16(half %s, <4 x half> %v)
  ret half %red
}

declare half @llvm.vector.reduce.fadd.v8f16(half, <8 x half>)

define half @vreduce_fadd_v8f16(<8 x half>* %x, half %s) {
; CHECK-LABEL: vreduce_fadd_v8f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 8, e16,m1,ta,mu
; CHECK-NEXT:    vle16.v v25, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e16,m1,ta,mu
; CHECK-NEXT:    vmv.v.i v26, 0
; CHECK-NEXT:    vsetivli a0, 8, e16,m1,ta,mu
; CHECK-NEXT:    vfredsum.vs v25, v25, v26
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    fadd.h fa0, fa0, ft0
; CHECK-NEXT:    ret
  %v = load <8 x half>, <8 x half>* %x
  %red = call reassoc half @llvm.vector.reduce.fadd.v8f16(half %s, <8 x half> %v)
  ret half %red
}

define half @vreduce_ord_fadd_v8f16(<8 x half>* %x, half %s) {
; CHECK-LABEL: vreduce_ord_fadd_v8f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 8, e16,m1,ta,mu
; CHECK-NEXT:    vle16.v v25, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e16,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v26, fa0
; CHECK-NEXT:    vsetivli a0, 8, e16,m1,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v25, v26
; CHECK-NEXT:    vfmv.f.s fa0, v25
; CHECK-NEXT:    ret
  %v = load <8 x half>, <8 x half>* %x
  %red = call half @llvm.vector.reduce.fadd.v8f16(half %s, <8 x half> %v)
  ret half %red
}

declare half @llvm.vector.reduce.fadd.v16f16(half, <16 x half>)

define half @vreduce_fadd_v16f16(<16 x half>* %x, half %s) {
; CHECK-LABEL: vreduce_fadd_v16f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 16, e16,m2,ta,mu
; CHECK-NEXT:    vle16.v v26, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e16,m1,ta,mu
; CHECK-NEXT:    vmv.v.i v25, 0
; CHECK-NEXT:    vsetivli a0, 16, e16,m2,ta,mu
; CHECK-NEXT:    vfredsum.vs v25, v26, v25
; CHECK-NEXT:    vsetvli zero, zero, e16,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    fadd.h fa0, fa0, ft0
; CHECK-NEXT:    ret
  %v = load <16 x half>, <16 x half>* %x
  %red = call reassoc half @llvm.vector.reduce.fadd.v16f16(half %s, <16 x half> %v)
  ret half %red
}

define half @vreduce_ord_fadd_v16f16(<16 x half>* %x, half %s) {
; CHECK-LABEL: vreduce_ord_fadd_v16f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 16, e16,m2,ta,mu
; CHECK-NEXT:    vle16.v v26, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e16,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v25, fa0
; CHECK-NEXT:    vsetivli a0, 16, e16,m2,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v26, v25
; CHECK-NEXT:    vsetvli zero, zero, e16,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s fa0, v25
; CHECK-NEXT:    ret
  %v = load <16 x half>, <16 x half>* %x
  %red = call half @llvm.vector.reduce.fadd.v16f16(half %s, <16 x half> %v)
  ret half %red
}

declare half @llvm.vector.reduce.fadd.v32f16(half, <32 x half>)

define half @vreduce_fadd_v32f16(<32 x half>* %x, half %s) {
; CHECK-LABEL: vreduce_fadd_v32f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi a1, zero, 32
; CHECK-NEXT:    vsetvli a2, a1, e16,m4,ta,mu
; CHECK-NEXT:    vle16.v v28, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e16,m1,ta,mu
; CHECK-NEXT:    vmv.v.i v25, 0
; CHECK-NEXT:    vsetvli a0, a1, e16,m4,ta,mu
; CHECK-NEXT:    vfredsum.vs v25, v28, v25
; CHECK-NEXT:    vsetvli zero, zero, e16,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    fadd.h fa0, fa0, ft0
; CHECK-NEXT:    ret
  %v = load <32 x half>, <32 x half>* %x
  %red = call reassoc half @llvm.vector.reduce.fadd.v32f16(half %s, <32 x half> %v)
  ret half %red
}

define half @vreduce_ord_fadd_v32f16(<32 x half>* %x, half %s) {
; CHECK-LABEL: vreduce_ord_fadd_v32f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi a1, zero, 32
; CHECK-NEXT:    vsetvli a2, a1, e16,m4,ta,mu
; CHECK-NEXT:    vle16.v v28, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e16,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v25, fa0
; CHECK-NEXT:    vsetvli a0, a1, e16,m4,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v28, v25
; CHECK-NEXT:    vsetvli zero, zero, e16,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s fa0, v25
; CHECK-NEXT:    ret
  %v = load <32 x half>, <32 x half>* %x
  %red = call half @llvm.vector.reduce.fadd.v32f16(half %s, <32 x half> %v)
  ret half %red
}

declare half @llvm.vector.reduce.fadd.v64f16(half, <64 x half>)

define half @vreduce_fadd_v64f16(<64 x half>* %x, half %s) {
; CHECK-LABEL: vreduce_fadd_v64f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi a1, zero, 64
; CHECK-NEXT:    vsetvli a2, a1, e16,m8,ta,mu
; CHECK-NEXT:    vle16.v v8, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e16,m1,ta,mu
; CHECK-NEXT:    vmv.v.i v25, 0
; CHECK-NEXT:    vsetvli a0, a1, e16,m8,ta,mu
; CHECK-NEXT:    vfredsum.vs v25, v8, v25
; CHECK-NEXT:    vsetvli zero, zero, e16,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    fadd.h fa0, fa0, ft0
; CHECK-NEXT:    ret
  %v = load <64 x half>, <64 x half>* %x
  %red = call reassoc half @llvm.vector.reduce.fadd.v64f16(half %s, <64 x half> %v)
  ret half %red
}

define half @vreduce_ord_fadd_v64f16(<64 x half>* %x, half %s) {
; CHECK-LABEL: vreduce_ord_fadd_v64f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi a1, zero, 64
; CHECK-NEXT:    vsetvli a2, a1, e16,m8,ta,mu
; CHECK-NEXT:    vle16.v v8, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e16,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v25, fa0
; CHECK-NEXT:    vsetvli a0, a1, e16,m8,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v8, v25
; CHECK-NEXT:    vsetvli zero, zero, e16,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s fa0, v25
; CHECK-NEXT:    ret
  %v = load <64 x half>, <64 x half>* %x
  %red = call half @llvm.vector.reduce.fadd.v64f16(half %s, <64 x half> %v)
  ret half %red
}

declare half @llvm.vector.reduce.fadd.v128f16(half, <128 x half>)

define half @vreduce_fadd_v128f16(<128 x half>* %x, half %s) {
; CHECK-LABEL: vreduce_fadd_v128f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi a1, zero, 64
; CHECK-NEXT:    vsetvli a2, a1, e16,m8,ta,mu
; CHECK-NEXT:    vle16.v v8, (a0)
; CHECK-NEXT:    addi a0, a0, 128
; CHECK-NEXT:    vle16.v v16, (a0)
; CHECK-NEXT:    vfadd.vv v8, v8, v16
; CHECK-NEXT:    vsetvli a0, zero, e16,m1,ta,mu
; CHECK-NEXT:    vmv.v.i v25, 0
; CHECK-NEXT:    vsetvli a0, a1, e16,m8,ta,mu
; CHECK-NEXT:    vfredsum.vs v25, v8, v25
; CHECK-NEXT:    vsetvli zero, zero, e16,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    fadd.h fa0, fa0, ft0
; CHECK-NEXT:    ret
  %v = load <128 x half>, <128 x half>* %x
  %red = call reassoc half @llvm.vector.reduce.fadd.v128f16(half %s, <128 x half> %v)
  ret half %red
}

define half @vreduce_ord_fadd_v128f16(<128 x half>* %x, half %s) {
; CHECK-LABEL: vreduce_ord_fadd_v128f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi a1, a0, 128
; CHECK-NEXT:    addi a2, zero, 64
; CHECK-NEXT:    vsetvli a3, a2, e16,m8,ta,mu
; CHECK-NEXT:    vle16.v v8, (a1)
; CHECK-NEXT:    vle16.v v16, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e16,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v25, fa0
; CHECK-NEXT:    vsetvli a0, a2, e16,m8,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v16, v25
; CHECK-NEXT:    vsetvli zero, zero, e16,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    vsetvli a0, zero, e16,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v25, ft0
; CHECK-NEXT:    vsetvli a0, a2, e16,m8,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v8, v25
; CHECK-NEXT:    vsetvli zero, zero, e16,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s fa0, v25
; CHECK-NEXT:    ret
  %v = load <128 x half>, <128 x half>* %x
  %red = call half @llvm.vector.reduce.fadd.v128f16(half %s, <128 x half> %v)
  ret half %red
}

declare float @llvm.vector.reduce.fadd.v1f32(float, <1 x float>)

define float @vreduce_fadd_v1f32(<1 x float>* %x, float %s) {
; CHECK-LABEL: vreduce_fadd_v1f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 1, e32,m1,ta,mu
; CHECK-NEXT:    vle32.v v25, (a0)
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    fadd.s fa0, fa0, ft0
; CHECK-NEXT:    ret
  %v = load <1 x float>, <1 x float>* %x
  %red = call reassoc float @llvm.vector.reduce.fadd.v1f32(float %s, <1 x float> %v)
  ret float %red
}

define float @vreduce_ord_fadd_v1f32(<1 x float>* %x, float %s) {
; CHECK-LABEL: vreduce_ord_fadd_v1f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 1, e32,m1,ta,mu
; CHECK-NEXT:    vle32.v v25, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e32,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v26, fa0
; CHECK-NEXT:    vsetivli a0, 1, e32,m1,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v25, v26
; CHECK-NEXT:    vfmv.f.s fa0, v25
; CHECK-NEXT:    ret
  %v = load <1 x float>, <1 x float>* %x
  %red = call float @llvm.vector.reduce.fadd.v1f32(float %s, <1 x float> %v)
  ret float %red
}

declare float @llvm.vector.reduce.fadd.v2f32(float, <2 x float>)

define float @vreduce_fadd_v2f32(<2 x float>* %x, float %s) {
; CHECK-LABEL: vreduce_fadd_v2f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 2, e32,m1,ta,mu
; CHECK-NEXT:    vle32.v v25, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e32,m1,ta,mu
; CHECK-NEXT:    vmv.v.i v26, 0
; CHECK-NEXT:    vsetivli a0, 2, e32,m1,ta,mu
; CHECK-NEXT:    vfredsum.vs v25, v25, v26
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    fadd.s fa0, fa0, ft0
; CHECK-NEXT:    ret
  %v = load <2 x float>, <2 x float>* %x
  %red = call reassoc float @llvm.vector.reduce.fadd.v2f32(float %s, <2 x float> %v)
  ret float %red
}

define float @vreduce_ord_fadd_v2f32(<2 x float>* %x, float %s) {
; CHECK-LABEL: vreduce_ord_fadd_v2f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 2, e32,m1,ta,mu
; CHECK-NEXT:    vle32.v v25, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e32,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v26, fa0
; CHECK-NEXT:    vsetivli a0, 2, e32,m1,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v25, v26
; CHECK-NEXT:    vfmv.f.s fa0, v25
; CHECK-NEXT:    ret
  %v = load <2 x float>, <2 x float>* %x
  %red = call float @llvm.vector.reduce.fadd.v2f32(float %s, <2 x float> %v)
  ret float %red
}

declare float @llvm.vector.reduce.fadd.v4f32(float, <4 x float>)

define float @vreduce_fadd_v4f32(<4 x float>* %x, float %s) {
; CHECK-LABEL: vreduce_fadd_v4f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 4, e32,m1,ta,mu
; CHECK-NEXT:    vle32.v v25, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e32,m1,ta,mu
; CHECK-NEXT:    vmv.v.i v26, 0
; CHECK-NEXT:    vsetivli a0, 4, e32,m1,ta,mu
; CHECK-NEXT:    vfredsum.vs v25, v25, v26
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    fadd.s fa0, fa0, ft0
; CHECK-NEXT:    ret
  %v = load <4 x float>, <4 x float>* %x
  %red = call reassoc float @llvm.vector.reduce.fadd.v4f32(float %s, <4 x float> %v)
  ret float %red
}

define float @vreduce_ord_fadd_v4f32(<4 x float>* %x, float %s) {
; CHECK-LABEL: vreduce_ord_fadd_v4f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 4, e32,m1,ta,mu
; CHECK-NEXT:    vle32.v v25, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e32,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v26, fa0
; CHECK-NEXT:    vsetivli a0, 4, e32,m1,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v25, v26
; CHECK-NEXT:    vfmv.f.s fa0, v25
; CHECK-NEXT:    ret
  %v = load <4 x float>, <4 x float>* %x
  %red = call float @llvm.vector.reduce.fadd.v4f32(float %s, <4 x float> %v)
  ret float %red
}

declare float @llvm.vector.reduce.fadd.v8f32(float, <8 x float>)

define float @vreduce_fadd_v8f32(<8 x float>* %x, float %s) {
; CHECK-LABEL: vreduce_fadd_v8f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 8, e32,m2,ta,mu
; CHECK-NEXT:    vle32.v v26, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e32,m1,ta,mu
; CHECK-NEXT:    vmv.v.i v25, 0
; CHECK-NEXT:    vsetivli a0, 8, e32,m2,ta,mu
; CHECK-NEXT:    vfredsum.vs v25, v26, v25
; CHECK-NEXT:    vsetvli zero, zero, e32,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    fadd.s fa0, fa0, ft0
; CHECK-NEXT:    ret
  %v = load <8 x float>, <8 x float>* %x
  %red = call reassoc float @llvm.vector.reduce.fadd.v8f32(float %s, <8 x float> %v)
  ret float %red
}

define float @vreduce_ord_fadd_v8f32(<8 x float>* %x, float %s) {
; CHECK-LABEL: vreduce_ord_fadd_v8f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 8, e32,m2,ta,mu
; CHECK-NEXT:    vle32.v v26, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e32,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v25, fa0
; CHECK-NEXT:    vsetivli a0, 8, e32,m2,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v26, v25
; CHECK-NEXT:    vsetvli zero, zero, e32,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s fa0, v25
; CHECK-NEXT:    ret
  %v = load <8 x float>, <8 x float>* %x
  %red = call float @llvm.vector.reduce.fadd.v8f32(float %s, <8 x float> %v)
  ret float %red
}

declare float @llvm.vector.reduce.fadd.v16f32(float, <16 x float>)

define float @vreduce_fadd_v16f32(<16 x float>* %x, float %s) {
; CHECK-LABEL: vreduce_fadd_v16f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 16, e32,m4,ta,mu
; CHECK-NEXT:    vle32.v v28, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e32,m1,ta,mu
; CHECK-NEXT:    vmv.v.i v25, 0
; CHECK-NEXT:    vsetivli a0, 16, e32,m4,ta,mu
; CHECK-NEXT:    vfredsum.vs v25, v28, v25
; CHECK-NEXT:    vsetvli zero, zero, e32,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    fadd.s fa0, fa0, ft0
; CHECK-NEXT:    ret
  %v = load <16 x float>, <16 x float>* %x
  %red = call reassoc float @llvm.vector.reduce.fadd.v16f32(float %s, <16 x float> %v)
  ret float %red
}

define float @vreduce_ord_fadd_v16f32(<16 x float>* %x, float %s) {
; CHECK-LABEL: vreduce_ord_fadd_v16f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 16, e32,m4,ta,mu
; CHECK-NEXT:    vle32.v v28, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e32,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v25, fa0
; CHECK-NEXT:    vsetivli a0, 16, e32,m4,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v28, v25
; CHECK-NEXT:    vsetvli zero, zero, e32,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s fa0, v25
; CHECK-NEXT:    ret
  %v = load <16 x float>, <16 x float>* %x
  %red = call float @llvm.vector.reduce.fadd.v16f32(float %s, <16 x float> %v)
  ret float %red
}

declare float @llvm.vector.reduce.fadd.v32f32(float, <32 x float>)

define float @vreduce_fadd_v32f32(<32 x float>* %x, float %s) {
; CHECK-LABEL: vreduce_fadd_v32f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi a1, zero, 32
; CHECK-NEXT:    vsetvli a2, a1, e32,m8,ta,mu
; CHECK-NEXT:    vle32.v v8, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e32,m1,ta,mu
; CHECK-NEXT:    vmv.v.i v25, 0
; CHECK-NEXT:    vsetvli a0, a1, e32,m8,ta,mu
; CHECK-NEXT:    vfredsum.vs v25, v8, v25
; CHECK-NEXT:    vsetvli zero, zero, e32,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    fadd.s fa0, fa0, ft0
; CHECK-NEXT:    ret
  %v = load <32 x float>, <32 x float>* %x
  %red = call reassoc float @llvm.vector.reduce.fadd.v32f32(float %s, <32 x float> %v)
  ret float %red
}

define float @vreduce_ord_fadd_v32f32(<32 x float>* %x, float %s) {
; CHECK-LABEL: vreduce_ord_fadd_v32f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi a1, zero, 32
; CHECK-NEXT:    vsetvli a2, a1, e32,m8,ta,mu
; CHECK-NEXT:    vle32.v v8, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e32,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v25, fa0
; CHECK-NEXT:    vsetvli a0, a1, e32,m8,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v8, v25
; CHECK-NEXT:    vsetvli zero, zero, e32,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s fa0, v25
; CHECK-NEXT:    ret
  %v = load <32 x float>, <32 x float>* %x
  %red = call float @llvm.vector.reduce.fadd.v32f32(float %s, <32 x float> %v)
  ret float %red
}

declare float @llvm.vector.reduce.fadd.v64f32(float, <64 x float>)

define float @vreduce_fadd_v64f32(<64 x float>* %x, float %s) {
; CHECK-LABEL: vreduce_fadd_v64f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi a1, zero, 32
; CHECK-NEXT:    vsetvli a2, a1, e32,m8,ta,mu
; CHECK-NEXT:    vle32.v v8, (a0)
; CHECK-NEXT:    addi a0, a0, 128
; CHECK-NEXT:    vle32.v v16, (a0)
; CHECK-NEXT:    vfadd.vv v8, v8, v16
; CHECK-NEXT:    vsetvli a0, zero, e32,m1,ta,mu
; CHECK-NEXT:    vmv.v.i v25, 0
; CHECK-NEXT:    vsetvli a0, a1, e32,m8,ta,mu
; CHECK-NEXT:    vfredsum.vs v25, v8, v25
; CHECK-NEXT:    vsetvli zero, zero, e32,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    fadd.s fa0, fa0, ft0
; CHECK-NEXT:    ret
  %v = load <64 x float>, <64 x float>* %x
  %red = call reassoc float @llvm.vector.reduce.fadd.v64f32(float %s, <64 x float> %v)
  ret float %red
}

define float @vreduce_ord_fadd_v64f32(<64 x float>* %x, float %s) {
; CHECK-LABEL: vreduce_ord_fadd_v64f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi a1, a0, 128
; CHECK-NEXT:    addi a2, zero, 32
; CHECK-NEXT:    vsetvli a3, a2, e32,m8,ta,mu
; CHECK-NEXT:    vle32.v v8, (a1)
; CHECK-NEXT:    vle32.v v16, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e32,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v25, fa0
; CHECK-NEXT:    vsetvli a0, a2, e32,m8,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v16, v25
; CHECK-NEXT:    vsetvli zero, zero, e32,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    vsetvli a0, zero, e32,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v25, ft0
; CHECK-NEXT:    vsetvli a0, a2, e32,m8,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v8, v25
; CHECK-NEXT:    vsetvli zero, zero, e32,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s fa0, v25
; CHECK-NEXT:    ret
  %v = load <64 x float>, <64 x float>* %x
  %red = call float @llvm.vector.reduce.fadd.v64f32(float %s, <64 x float> %v)
  ret float %red
}

declare double @llvm.vector.reduce.fadd.v1f64(double, <1 x double>)

define double @vreduce_fadd_v1f64(<1 x double>* %x, double %s) {
; CHECK-LABEL: vreduce_fadd_v1f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 1, e64,m1,ta,mu
; CHECK-NEXT:    vle64.v v25, (a0)
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    fadd.d fa0, fa0, ft0
; CHECK-NEXT:    ret
  %v = load <1 x double>, <1 x double>* %x
  %red = call reassoc double @llvm.vector.reduce.fadd.v1f64(double %s, <1 x double> %v)
  ret double %red
}

define double @vreduce_ord_fadd_v1f64(<1 x double>* %x, double %s) {
; CHECK-LABEL: vreduce_ord_fadd_v1f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 1, e64,m1,ta,mu
; CHECK-NEXT:    vle64.v v25, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e64,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v26, fa0
; CHECK-NEXT:    vsetivli a0, 1, e64,m1,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v25, v26
; CHECK-NEXT:    vfmv.f.s fa0, v25
; CHECK-NEXT:    ret
  %v = load <1 x double>, <1 x double>* %x
  %red = call double @llvm.vector.reduce.fadd.v1f64(double %s, <1 x double> %v)
  ret double %red
}

declare double @llvm.vector.reduce.fadd.v2f64(double, <2 x double>)

define double @vreduce_fadd_v2f64(<2 x double>* %x, double %s) {
; CHECK-LABEL: vreduce_fadd_v2f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 2, e64,m1,ta,mu
; CHECK-NEXT:    vle64.v v25, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e64,m1,ta,mu
; CHECK-NEXT:    vmv.v.i v26, 0
; CHECK-NEXT:    vsetivli a0, 2, e64,m1,ta,mu
; CHECK-NEXT:    vfredsum.vs v25, v25, v26
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    fadd.d fa0, fa0, ft0
; CHECK-NEXT:    ret
  %v = load <2 x double>, <2 x double>* %x
  %red = call reassoc double @llvm.vector.reduce.fadd.v2f64(double %s, <2 x double> %v)
  ret double %red
}

define double @vreduce_ord_fadd_v2f64(<2 x double>* %x, double %s) {
; CHECK-LABEL: vreduce_ord_fadd_v2f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 2, e64,m1,ta,mu
; CHECK-NEXT:    vle64.v v25, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e64,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v26, fa0
; CHECK-NEXT:    vsetivli a0, 2, e64,m1,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v25, v26
; CHECK-NEXT:    vfmv.f.s fa0, v25
; CHECK-NEXT:    ret
  %v = load <2 x double>, <2 x double>* %x
  %red = call double @llvm.vector.reduce.fadd.v2f64(double %s, <2 x double> %v)
  ret double %red
}

declare double @llvm.vector.reduce.fadd.v4f64(double, <4 x double>)

define double @vreduce_fadd_v4f64(<4 x double>* %x, double %s) {
; CHECK-LABEL: vreduce_fadd_v4f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 4, e64,m2,ta,mu
; CHECK-NEXT:    vle64.v v26, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e64,m1,ta,mu
; CHECK-NEXT:    vmv.v.i v25, 0
; CHECK-NEXT:    vsetivli a0, 4, e64,m2,ta,mu
; CHECK-NEXT:    vfredsum.vs v25, v26, v25
; CHECK-NEXT:    vsetvli zero, zero, e64,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    fadd.d fa0, fa0, ft0
; CHECK-NEXT:    ret
  %v = load <4 x double>, <4 x double>* %x
  %red = call reassoc double @llvm.vector.reduce.fadd.v4f64(double %s, <4 x double> %v)
  ret double %red
}

define double @vreduce_ord_fadd_v4f64(<4 x double>* %x, double %s) {
; CHECK-LABEL: vreduce_ord_fadd_v4f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 4, e64,m2,ta,mu
; CHECK-NEXT:    vle64.v v26, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e64,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v25, fa0
; CHECK-NEXT:    vsetivli a0, 4, e64,m2,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v26, v25
; CHECK-NEXT:    vsetvli zero, zero, e64,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s fa0, v25
; CHECK-NEXT:    ret
  %v = load <4 x double>, <4 x double>* %x
  %red = call double @llvm.vector.reduce.fadd.v4f64(double %s, <4 x double> %v)
  ret double %red
}

declare double @llvm.vector.reduce.fadd.v8f64(double, <8 x double>)

define double @vreduce_fadd_v8f64(<8 x double>* %x, double %s) {
; CHECK-LABEL: vreduce_fadd_v8f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 8, e64,m4,ta,mu
; CHECK-NEXT:    vle64.v v28, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e64,m1,ta,mu
; CHECK-NEXT:    vmv.v.i v25, 0
; CHECK-NEXT:    vsetivli a0, 8, e64,m4,ta,mu
; CHECK-NEXT:    vfredsum.vs v25, v28, v25
; CHECK-NEXT:    vsetvli zero, zero, e64,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    fadd.d fa0, fa0, ft0
; CHECK-NEXT:    ret
  %v = load <8 x double>, <8 x double>* %x
  %red = call reassoc double @llvm.vector.reduce.fadd.v8f64(double %s, <8 x double> %v)
  ret double %red
}

define double @vreduce_ord_fadd_v8f64(<8 x double>* %x, double %s) {
; CHECK-LABEL: vreduce_ord_fadd_v8f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 8, e64,m4,ta,mu
; CHECK-NEXT:    vle64.v v28, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e64,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v25, fa0
; CHECK-NEXT:    vsetivli a0, 8, e64,m4,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v28, v25
; CHECK-NEXT:    vsetvli zero, zero, e64,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s fa0, v25
; CHECK-NEXT:    ret
  %v = load <8 x double>, <8 x double>* %x
  %red = call double @llvm.vector.reduce.fadd.v8f64(double %s, <8 x double> %v)
  ret double %red
}

declare double @llvm.vector.reduce.fadd.v16f64(double, <16 x double>)

define double @vreduce_fadd_v16f64(<16 x double>* %x, double %s) {
; CHECK-LABEL: vreduce_fadd_v16f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 16, e64,m8,ta,mu
; CHECK-NEXT:    vle64.v v8, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e64,m1,ta,mu
; CHECK-NEXT:    vmv.v.i v25, 0
; CHECK-NEXT:    vsetivli a0, 16, e64,m8,ta,mu
; CHECK-NEXT:    vfredsum.vs v25, v8, v25
; CHECK-NEXT:    vsetvli zero, zero, e64,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    fadd.d fa0, fa0, ft0
; CHECK-NEXT:    ret
  %v = load <16 x double>, <16 x double>* %x
  %red = call reassoc double @llvm.vector.reduce.fadd.v16f64(double %s, <16 x double> %v)
  ret double %red
}

define double @vreduce_ord_fadd_v16f64(<16 x double>* %x, double %s) {
; CHECK-LABEL: vreduce_ord_fadd_v16f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 16, e64,m8,ta,mu
; CHECK-NEXT:    vle64.v v8, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e64,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v25, fa0
; CHECK-NEXT:    vsetivli a0, 16, e64,m8,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v8, v25
; CHECK-NEXT:    vsetvli zero, zero, e64,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s fa0, v25
; CHECK-NEXT:    ret
  %v = load <16 x double>, <16 x double>* %x
  %red = call double @llvm.vector.reduce.fadd.v16f64(double %s, <16 x double> %v)
  ret double %red
}

declare double @llvm.vector.reduce.fadd.v32f64(double, <32 x double>)

define double @vreduce_fadd_v32f64(<32 x double>* %x, double %s) {
; CHECK-LABEL: vreduce_fadd_v32f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a1, 16, e64,m8,ta,mu
; CHECK-NEXT:    vle64.v v8, (a0)
; CHECK-NEXT:    addi a0, a0, 128
; CHECK-NEXT:    vle64.v v16, (a0)
; CHECK-NEXT:    vfadd.vv v8, v8, v16
; CHECK-NEXT:    vsetvli a0, zero, e64,m1,ta,mu
; CHECK-NEXT:    vmv.v.i v25, 0
; CHECK-NEXT:    vsetivli a0, 16, e64,m8,ta,mu
; CHECK-NEXT:    vfredsum.vs v25, v8, v25
; CHECK-NEXT:    vsetvli zero, zero, e64,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    fadd.d fa0, fa0, ft0
; CHECK-NEXT:    ret
  %v = load <32 x double>, <32 x double>* %x
  %red = call reassoc double @llvm.vector.reduce.fadd.v32f64(double %s, <32 x double> %v)
  ret double %red
}

define double @vreduce_ord_fadd_v32f64(<32 x double>* %x, double %s) {
; CHECK-LABEL: vreduce_ord_fadd_v32f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi a1, a0, 128
; CHECK-NEXT:    vsetivli a2, 16, e64,m8,ta,mu
; CHECK-NEXT:    vle64.v v8, (a1)
; CHECK-NEXT:    vle64.v v16, (a0)
; CHECK-NEXT:    vsetvli a0, zero, e64,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v25, fa0
; CHECK-NEXT:    vsetivli a0, 16, e64,m8,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v16, v25
; CHECK-NEXT:    vsetvli zero, zero, e64,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s ft0, v25
; CHECK-NEXT:    vsetvli a0, zero, e64,m1,ta,mu
; CHECK-NEXT:    vfmv.v.f v25, ft0
; CHECK-NEXT:    vsetivli a0, 16, e64,m8,ta,mu
; CHECK-NEXT:    vfredosum.vs v25, v8, v25
; CHECK-NEXT:    vsetvli zero, zero, e64,m1,ta,mu
; CHECK-NEXT:    vfmv.f.s fa0, v25
; CHECK-NEXT:    ret
  %v = load <32 x double>, <32 x double>* %x
  %red = call double @llvm.vector.reduce.fadd.v32f64(double %s, <32 x double> %v)
  ret double %red
}