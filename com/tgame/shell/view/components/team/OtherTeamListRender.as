package com.tgame.shell.view.components.team
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.tgame.common.ui.componets.*;
   
   public class OtherTeamListRender extends FListCellRenderer
   {
      
      public function OtherTeamListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var lb:FLabel;
         _height = 21;
         lb = new FLabel();
         with(lb)
         {
            x = 6;
            y = 2;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            if(data.declare.charAt(0) == "[" && data.declare.indexOf("]") != -1)
            {
               text = data.declare.split("]")[1];
            }
            else
            {
               text = data.declare;
            }
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 133;
            y = 2;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            if(data.leader.charAt(0) == "[" && data.leader.indexOf("]") != -1)
            {
               text = data.leader.split("]")[1];
            }
            else
            {
               text = data.leader;
            }
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 230;
            y = 2;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.level;
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 268;
            y = 2;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.count + "/7";
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 308;
            y = 2;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.order;
         }
         addChild(lb);
      }
   }
}

