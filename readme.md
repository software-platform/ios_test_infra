# Objective

This is a summary of efforts towards creating a UI-test-focused wrapper framework that could abstract away EarlGrey (+adding helper methods that rely on this). In principle it should also allow Carthage compatibility, but this was not the objective and was not tested at any point. The experiment was a timeboxed best-effort-style research project.

Current state of EarlGrey (EG2, as in `earlgrey2` branch) doesn't allow this because of usage of static libs and incompatibility with clang modules. It was possible previously, as EG1 was a single framework module. Another possible way, but requiring a substantial boilerplate setup, is adding helper methods directly in the app project, not in a wrapper.

# What was done

### Demo Setup

First thing tried was doing a regular direct in-app setup to get a working example testing suite. Initially the setup & documentation were blamed, and while EG2 setup is relatively complex it turned out problems with build stability were the most important factor. It needs to be taken into account with any next tries to mitigate time spent.

The tip of `earlgrey2` was not-so-stable at the point of trying this the first time, release tags `2.0.0` and `2.1.0` also required fixes. First tries were done with applying some manual fixes to otherwise not-building (and/or erroring out at-runtime) commits between `2.1.0` and `HEAD` of `earlgrey2`. Later ones were done on a newer `earlgrey2` version that turned out to compile & work good-enough out of the box. 

Then it was confirmed that EG2 neither does work as a part of the wrapper nor is the wrapper easily fixable. Some ad-hoc modification of EG itself was also attempted at this point, with no significant results.

### Existing Target Modification

The next step was an attempt to modify a created fork of EarlGrey to see whether it's feasible to modify the internal setup to work with desired usecase.

First, with modifying `.modulemap` for `AppFramework` target and adding relevant headers to public set in it's build phase, initial `non-modular` errors were worked around (at least all the currently detectable ones), but there were clearly other problems, like `Duplicate interface definition for class 'EarlGreyImpl'` that pointed at exactly the same definition twice. Clearly the modified setup was broken, and it was decided to stop trying modifying pre-existing targets for now.

### New Targets

Last (abandoned while still in progress) effort was focused on creating entirely new targets in EG2 fork and try to make a new build scheme that builds and works with the wrapper. Some attempts were made for 2 main approaches:
  * re-creating a previous static libs + framework setup, but with frameworks only
  * creating a single new framework, optionally wrapping objc one in a swift one

Those approaches are partially implemented in branches on the forked repo: `framework-conversion-attempt` and `framework-conversion-attempt-single-framework`. Recreating them on future versions of EG would be relatively easy (though might be time consuming). The first is based around creating a framework target for each target present in original `EarlGrey.xcodeproj`, adding same files to compile set and header set, and working from there. The second is based around creating a single new framework target and trying to add "all the code" to it. 

# Results

"Existing Target Modification" was abandoned for the time being after running into multiple instances of `duplicate symbol` errors, solving of which turned the problems into apparent circular dependencies between targets and/or `undeclared type` errors. 

"New Targets" was still in progress when experiments ended, but duplicate symbols were a major problem, some of which were overcome by some fixes to how code was structured (e.g. moving a method from global scope into class scope). Most were worked around by not compiling files containing the duplicates, which probably had an effect of runtime problems, but the experiment never reached a stage allowing to test this. A stage where project was building successfully was reached, but proper integration into a test app was not done. A lot of `undeclared type` errors and general problems with header setup were not solved in intended timebox. Some attempts were made at creating an intermediary Swift framework that would be imported by the demo app, but this was also not finished. Latest snapshot of this effort is available at `attempted-fork-integration` and `framework-conversion-attempt-single-framework` branches (head commits not tidied up, provided as-is at the time of writing).

In retrospect "Existing Target Modification" and both "New Targets" approaches point to the similar issues with unclearly defined separation between existing EG2 targets and dependencies between them. Gathering extra knowledge about how these work and/or putting more work into checking how these interact both at build-time and at run-time is needed to establish how to approach further modification of EG.

### Artifacts

Demo project used for experiments is available at https://github.com/software-platform/ios_test_infra
EarlGrey fork used for experiments is available at https://github.com/3-n/EarlGrey/
Both repositories contain this report file: on `master` for demo project and on `framework-conversion-attempt-single-framework` for EG fork.

### Decicions Made

The current attempt reached it's intended timebox (1 month) and at this stage it was decided to cut the losses and discontinue further investigation. The recommended approach for now is to keep helper methods within the app projects - where it is known to be trivial to achieve.

### Possible Next Steps

In principle, of the tried approaches the most promising seems to be the "New Target" one.

Some initial issues were already fixed on the branch that's in the forked EG repo, more remain. It's still possible remaining ones are fixable in reasonable time. Some functionality was already turned off temporarily, perhaps trying to remove a bigger part of the source and adding it back step-by-step would make the effort more manageable. 

Only limited time was put into understanding the rationale behind the internal setup of EG2. Understanding the setup better, both from maintainer and user perspective, could yield some further insight into how to approach changes to the EG2 setup, while keeping the framework fully functional & regression-free. Based on the pace of the current efforts, it might save time overall, too.

All of the attempts at modifying the EG2 setup were done directly on the project itself. 
Something that was not tried and should be considered is creating a simplified (less code, file count, headers, dependencies) demo prototype that reproduces same issues as EG. Fixes in the prototype could then be transferred back to EG. This might save time if reproduction plus transfer work is less than additional work with fixing issues in a bigger project. 
