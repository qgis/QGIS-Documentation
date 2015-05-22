|updatedisclaimer|

Point pattern
=============

F function
----------

Description
...........

<put algorithm description here>

Parameters
..........

``Layer`` [vector: any]
  <put parameter description here>

``Nsim`` [number]
  <put parameter description here>

  Default: *10.0*

Outputs
.......

``R Plots`` [html]
  <put output description here>

Console usage
.............

::

  processing.runalg('r:ffunction', layer, nsim, rplots)

See also
........

G function
----------

Description
...........

<put algorithm description here>

Parameters
..........

``Layer`` [vector: any]
  <put parameter description here>

``Nsim`` [number]
  <put parameter description here>

  Default: *10.0*

Outputs
.......

``R Plots`` [html]
  <put output description here>

Console usage
.............

::

  processing.runalg('r:gfunction', layer, nsim, rplots)

See also
........

Monte-Carlo spatial randomness
------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Layer`` [vector: any]
  <put parameter description here>

``Simulations`` [number]
  <put parameter description here>

  Default: *100.0*

``Optional plot name`` [string]
  <put parameter description here>

  Default: *(not set)*

Outputs
.......

``R Plots`` [html]
  <put output description here>

``R Console Output`` [html]
  <put output description here>

Console usage
.............

::

  processing.runalg('r:montecarlospatialrandomness', layer, simulations, optional_plot_name, rplots, r_console_output)

See also
........

Quadrat analysis
----------------

Description
...........

<put algorithm description here>

Parameters
..........

``Layer`` [vector: any]
  <put parameter description here>

Outputs
.......

``R Plots`` [html]
  <put output description here>

``R Console Output`` [html]
  <put output description here>

Console usage
.............

::

  processing.runalg('r:quadratanalysis', layer, rplots, r_console_output)

See also
........

Random sampling grid
--------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Layer`` [vector: any]
  <put parameter description here>

``Size`` [number]
  <put parameter description here>

  Default: *10.0*

Outputs
.......

``Output`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('r:randomsamplinggrid', layer, size, output)

See also
........

Regular sampling grid
---------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Layer`` [vector: any]
  <put parameter description here>

``Size`` [number]
  <put parameter description here>

  Default: *10.0*

Outputs
.......

``Output`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('r:regularsamplinggrid', layer, size, output)

See also
........

Relative distribution (distance covariate)
------------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Layer`` [vector: any]
  <put parameter description here>

``Covariate`` [vector: any]
  <put parameter description here>

``Covariate name`` [string]
  <put parameter description here>

  Default: *mandatory_covariate_name_(no_spaces)*

``x label`` [string]
  <put parameter description here>

  Default: *(not set)*

``Plot name`` [string]
  <put parameter description here>

  Default: *(not set)*

``Legend position`` [string]
  <put parameter description here>

  Default: *float*

Outputs
.......

``R Plots`` [html]
  <put output description here>

Console usage
.............

::

  processing.runalg('r:relativedistributiondistancecovariate', layer, covariate, covariate_name, x_label, plot_name, legend_position, rplots)

See also
........

Relative distribution (raster covariate)
----------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``points`` [vector: any]
  <put parameter description here>

``covariate`` [raster]
  <put parameter description here>

``covariate name`` [string]
  <put parameter description here>

  Default: *mandatory_covariate_name_(no_spaces)*

``x label`` [string]
  <put parameter description here>

  Default: *(not set)*

``plot name`` [string]
  <put parameter description here>

  Default: *(not set)*

``legend position`` [string]
  <put parameter description here>

  Default: *float*

Outputs
.......

``R Plots`` [html]
  <put output description here>

Console usage
.............

::

  processing.runalg('r:relativedistributionrastercovariate', points, covariate, covariate_name, x_label, plot_name, legend_position, rplots)

See also
........

Ripley - Rasson spatial domain
------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Layer`` [vector: any]
  <put parameter description here>

Outputs
.......

``Output`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('r:ripleyrassonspatialdomain', layer, output)

See also
........

