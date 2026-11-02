package com.tgame.shell.view.components.zhengduozhan
{
   import com.asQuery.$;
   import com.tgame.common.ui.componets.BasePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import game.display.List;
   import game.skin.ZhengDuoZhan20180713Skin;
   import game.utils.SkinTools;
   
   public class ZhengDuoZhanPanel extends BasePanel
   {
      
      public static const ZHENGDUOZHAN_CLICK:String = "ZHENGDUOZHAN_CLICK";
      
      private var list:List;
      
      public function ZhengDuoZhanPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ZhengDuoZhan20180713Skin.skin,"zhengduozhan");
         $("DFZQLQAN1 daanniu1 daanniu2",this,true).click(this.onClickHanlder);
         $("YBZLGBAN",this,true).click(this.onClick);
      }
      
      private function onClickHanlder(param1:MouseEvent) : void
      {
         switch(param1.target.name)
         {
            case "DFZQLQAN1":
               dispatchEvent(new BaseEvent(ZhengDuoZhanPanel.ZHENGDUOZHAN_CLICK,"",3));
               break;
            case "daanniu1":
               dispatchEvent(new BaseEvent(ZhengDuoZhanPanel.ZHENGDUOZHAN_CLICK,"",2));
               break;
            case "daanniu2":
               dispatchEvent(new BaseEvent(ZhengDuoZhanPanel.ZHENGDUOZHAN_CLICK,"",1));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      override protected function createVariableReference() : void
      {
         this.list = getChildByName("leibiao") as List;
         this.list.ItemClass = ListRender;
         this.list.verticalGap = 6;
         this.list.columnCount = 1;
      }
      
      public function setZhengDuoZhanData(param1:Object) : void
      {
         $("wenben3",this,true).attr("text",param1.rank);
         $("wenben4",this,true).attr("text",param1.score);
         this.list.DataSource = param1.arr;
      }
   }
}

import com.asQuery.$;
import game.display.ListItemRender;

class ListRender extends ListItemRender
{
   
   public function ListRender()
   {
      super();
   }
   
   override public function set data(param1:Object) : void
   {
      super.data = param1;
      $("wenben1",this,true).attr("text",data.name);
      $("wenben2",this,true).attr("text",data.rank + "");
   }
}
