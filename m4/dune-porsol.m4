dnl -*- autoconf -*-
# Macros needed to find dune-porsol and dependent libraries.  They are called by
# the macros in ${top_src_dir}/dependencies.m4, which is generated by
# "dunecontrol autogen"

# Additional checks needed to build dune-porsol
# This macro should be invoked by every module which depends on dune-porsol, as
# well as by dune-porsol itself
AC_DEFUN([DUNE_PORSOL_CHECKS],
[
        # BLAS and LAPACK support.
        #
        # NOTE: ACX_LAPACK internally AC_REQUIRE's ACX_BLAS which,
        # subsequently, AC_REQUIRE's AC_F77_LIBRARY_LDFLAGS which sets
        # the $FLIBS macro.
        AC_REQUIRE([AC_F77_WRAPPERS])
        AC_REQUIRE([ACX_LAPACK])

        DUNE_ADD_MODULE_DEPS([DUNE_PORSOL],dnl
                             [DUNE_PORSOL],dnl
          [],[],dnl
          [[$LAPACK_LIBS] [$BLAS_LIBS] [$FLIBS]])

        # Additional summary entries.
        DUNE_ADD_SUMMARY_ENTRY([BLAS], [$acx_blas_ok])
        DUNE_ADD_SUMMARY_ENTRY([LAPACK], [$acx_lapack_ok])
])

# Additional checks needed to find dune-porsol
# This macro should be invoked by every module which depends on dune-porsol, but
# not by dune-porsol itself
AC_DEFUN([DUNE_PORSOL_CHECK_MODULE],
[
  DUNE_CHECK_MODULES([dune-porsol],
                     [porsol/mimetic/IncompFlowSolverHybrid.hpp])
])