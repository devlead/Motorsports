using System;
using Cake.Frosting;
using Cake.IIS;

namespace Build.Tasks {
  [TaskName(nameof(StopIISApplicationPoolIfExists))]
  public sealed class StopIISApplicationPoolIfExists : FrostingTaskWithProps<IISApplicationProps> {
    public override bool ShouldRun(FrostingContext context) {
      var props = GetProperties(context);

      return context.PoolExists(props.IISApplicationPoolSettings.Name);
    }
    
    public override void Run(FrostingContext context) {
      var props = GetProperties(context);

      context.StopPool(props.IISApplicationPoolSettings.Name);
      System.Threading.Tasks.Task.Delay(TimeSpan.FromSeconds(4)).Wait(); // Make sure it is stopped
    }
  }
}