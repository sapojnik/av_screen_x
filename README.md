Adaptor and Vector screens self-contained package, a development version.

## Requirements
- Python (version 3.6 or higher),
- awk
- cwltool (1.0 or higher)
- Perl (only for optional Vector screens)

You can get by without `cwltool` by adding `--nocwl` flag,
but then only the first command in the workflow would be executed (which is `bin/vecscreen`)

## Quick Start
Executing the screen with a sample fasta file, included in the tarball:
```
mkdir av_screen_x; cd av_screen_x # use any name in place of av_screen_x
wget https://raw.githubusercontent.com/sapojnik/av_screen_x/main/av_screen_x.py
chmod a+x av_screen_x.py
./av_screen_x.py samples/GCA_000173135.1_reduced.1.fna
```
This downloads the tarball from:
  https://s3.amazonaws.com/sapojnik-dev/av_screen_x.tgz
and unpacks it. Subsequent executions do not repeat download/unpacking,
as long as there is "av_screen_x.tgz" file in the current directory.

The script also generates `autogen.yaml` and executes `progs/workflow_vs.cwl` workflow with `cwltool`.
As of 2021/07/15, this workflow only implements the adaptor screen,
which involves these 2 executables:
  `bin/vecscreen bin/VSlistTo1HitPerLine.awk`

Output will be located in the `output` subdirectory, or the one specified after `-o` option.
If that directory exists, then a new directory will be created, with a version number appended.

## Misc.
Vectors and common contaminants screen is described in `progs/workflow.cwl`
It may be executed afterwards as:
```
  cwltool --outdir output progs/workflow.cwl autogen.yaml
```
This workflow uses `bin/blastn` and `bin/MegaBlastFilter`


`av_screen_x.py` was derived from `pgap.py` described at:
  https://github.com/ncbi/pgap/wiki/Quick-Start
(by cutting out the bulk of the code, and adding just a few lines, mostly under `Pipeline.__init__` and `main`).

See also: GP-30954 FSCR on the cloud: isolate VecScreen software with adaptor database
