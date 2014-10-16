//------------------------------------------------------------------------------
// <autogenerated>
//     This code was generated by a tool.
//     Generated by Merlin Version: 1.0.0.0
//
//     Changes to this file may cause incorrect behavior and will be lost if 
//     the code is regenerated.
// </autogenerated>
//------------------------------------------------------------------------------
using System;
using System.Collections.ObjectModel;
using System.Runtime.Serialization;


namespace IssueVision.Domain.Entities
{
    [Serializable()]
    public partial class SubStatusesList :  Collection<SubStatuses>
    {
        public SubStatuses First()
        {
          return base.Count > 0 ? base[0] : null;
        }
    }
    
    [DataContract()]
    public partial class SubStatuses{
      
        private Byte _subStatusId;
        private String _name;
        private IssuesList _issues;  

      public SubStatuses() : base()
      {
      }

      public SubStatuses(Byte subStatusId, String name) : base()
      {
          
           _subStatusId = subStatusId;
           _name = name;
      }
  
    
        /// <summary>
        /// Public Property SubStatusId
        /// </summary>
        /// <returns>SubStatusId as Byte</returns>
        /// <remarks></remarks>
        [DataMember()]
        public virtual Byte SubStatusId
        {
            get{return this._subStatusId;}
            set{this._subStatusId = value;}
        }

        /// <summary>
        /// Public Property Name
        /// </summary>
        /// <returns>Name as String</returns>
        /// <remarks></remarks>
        [DataMember()]
        public virtual String Name
        {
            get{return this._name;}
            set{this._name = value;}
        }

        [DataMember()]
        public virtual IssuesList Issues 
        {
          get { return  _issues;}
          set { _issues = value;}
        }
  
      
    }
 }     