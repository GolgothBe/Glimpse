/* libglimpse - The Glimpse Library
 * Copyright (C) 1995-2003 Peter Mattis and Spencer Kimball
 *
 * gimpdebug_pdb.c
 *
 * This library is free software: you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library.  If not, see
 * <https://www.gnu.org/licenses/>.
 */

/* NOTE: This file is auto-generated by pdbgen.pl */

#include "config.h"

#include "gimp.h"


/**
 * SECTION: gimpdebug
 * @title: gimpdebug
 * @short_description: Debug utility functions
 *
 * Miscellaneous debug utility functions. Not part of the stable
 * library interface.
 **/


/**
 * gimp_debug_timer_start:
 *
 * Starts measuring elapsed time.
 *
 * This procedure starts a timer, measuring the elapsed time since the
 * call. Each call to this procedure should be matched by a call to
 * gimp_debug_timer_end(), which returns the elapsed time.
 * If there is already an active timer, it is not affected by the call,
 * however, a matching gimp_debug_timer_end() call is still required.
 *
 * This is a debug utility procedure. It is subject to change at any
 * point, and should not be used in production.
 *
 * Returns: TRUE on success.
 **/
gboolean
gimp_debug_timer_start (void)
{
  GimpParam *return_vals;
  gint nreturn_vals;
  gboolean success = TRUE;

  return_vals = gimp_run_procedure ("gimp-debug-timer-start",
                                    &nreturn_vals,
                                    GIMP_PDB_END);

  success = return_vals[0].data.d_status == GIMP_PDB_SUCCESS;

  gimp_destroy_params (return_vals, nreturn_vals);

  return success;
}

/**
 * gimp_debug_timer_end:
 *
 * Finishes measuring elapsed time.
 *
 * This procedure stops the timer started by a previous
 * gimp_debug_timer_start() call, and prints and returns the elapsed
 * time.
 * If there was already an active timer at the time of corresponding
 * call to gimp_debug_timer_start(), a dummy value is returned.
 *
 * This is a debug utility procedure. It is subject to change at any
 * point, and should not be used in production.
 *
 * Returns: The elapsed time, in seconds.
 **/
gdouble
gimp_debug_timer_end (void)
{
  GimpParam *return_vals;
  gint nreturn_vals;
  gdouble elapsed = 0.0;

  return_vals = gimp_run_procedure ("gimp-debug-timer-end",
                                    &nreturn_vals,
                                    GIMP_PDB_END);

  if (return_vals[0].data.d_status == GIMP_PDB_SUCCESS)
    elapsed = return_vals[1].data.d_float;

  gimp_destroy_params (return_vals, nreturn_vals);

  return elapsed;
}
