using Cake.Common.IO;
using Cake.Common.Tools.DotNetCore;
using Cake.Common.Tools.DotNetCore.Clean;
using Cake.Common.Tools.DotNetCore.Publish;
using Cake.Core;
using Cake.Frosting;

namespace Build.Tasks {
  [TaskName(nameof(Publish))]
  [Dependency(typeof(InitVersion))]
  [Dependency(typeof(RestorePackages))]
  public sealed class Publish : FrostingTaskWithProps<PublishProps> {
    public override void Run(FrostingContext context) {
      var props = GetProperties(context);

      context.CleanDirectory(props.PublishTargetDirectory);
      context.DotNetCoreClean(
        props.ScaffoldingProjectFile.FullPath,
        new DotNetCoreCleanSettings {
          Verbosity = props.GlobalProps.DotNetCoreVerbosity,
          Configuration = props.GlobalProps.Configuration
        });
      context.DotNetCorePublish(
        props.ScaffoldingProjectFile.FullPath,
        new DotNetCorePublishSettings {
          Configuration = props.GlobalProps.Configuration,
          OutputDirectory = props.PublishTargetDirectory,
          Verbosity = props.GlobalProps.DotNetCoreVerbosity,
          ArgumentCustomization = args => args.Append("--no-restore")
        });
    }
  }
}