﻿using System;
using System.ComponentModel;
using System.Data.Objects.DataClasses;
using System.Web.UI;

namespace Motorsports.Scaffolding.Web.DynamicData.FieldTemplates
{
  public partial class ManyToManyField : System.Web.DynamicData.FieldTemplateUserControl
  {
    protected override void OnDataBinding(EventArgs e)
    {
      base.OnDataBinding(e);

      object entity;
      ICustomTypeDescriptor rowDescriptor = Row as ICustomTypeDescriptor;
      if (rowDescriptor != null)
      {
        entity = rowDescriptor.GetPropertyOwner(null);
      }
      else
      {
        entity = Row;
      }

      var entityCollection = Column.EntityTypeProperty.GetValue(entity, null);
      var realEntityCollection = entityCollection as RelatedEnd;
      if (realEntityCollection != null && !realEntityCollection.IsLoaded)
      {
        realEntityCollection.Load();
      }

      Repeater1.DataSource = entityCollection;
      Repeater1.DataBind();
    }

    public override Control DataControl
    {
      get
      {
        return Repeater1;
      }
    }

  }
}
