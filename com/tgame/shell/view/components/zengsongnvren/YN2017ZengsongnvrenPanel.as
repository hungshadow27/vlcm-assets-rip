package com.tgame.shell.view.components.zengsongnvren
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.manager.PipeManager;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import game.display.List;
   import game.skin.XinHongBaoSkin;
   import game.utils.SkinTools;
   
   public class YN2017ZengsongnvrenPanel extends BasePanel
   {
      
      public static const ZENGSONGNVRENPAIHANGBANGJIANGLI:String = "ZENGSONGNVRENPAIHANGBANGJIANGLI";
      
      private var item:ItemFace;
      
      private var list:List;
      
      public function YN2017ZengsongnvrenPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(XinHongBaoSkin.skin,"xinhongbao");
      }
      
      override protected function createVariableReference() : void
      {
         this.list = getChildByName("paihangbangleibiao") as List;
         this.list.ItemClass = ListElement;
         this.list.verticalGap = 10;
         $("anniu1 anniu2 lingqu",this,true).click(this.clickHanlder);
         $("guanbi",this,true).click(function():*
         {
            onClose();
         });
      }
      
      public function setData(param1:Object) : void
      {
         this.list.DataSource = param1.arr;
         $("WDJFsz",this,true).attr("text",param1.jifen);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         switch(param1.target.name)
         {
            case "anniu1":
               dispatchEvent(new BaseEvent(ZENGSONGNVRENPAIHANGBANGJIANGLI));
               break;
            case "anniu2":
               PipeManager.sendMsg(PipeConstants.SHOW_QINGRENJIESONGHUA_PLANE,8);
               break;
            case "lingqu":
               PipeManager.sendMsg(PipeConstants.SEND_53099,[75]);
         }
      }
   }
}

import com.asQuery.$;
import game.display.ListItemRender;

class ListElement extends ListItemRender
{
   
   public function ListElement()
   {
      super();
      this.buttonMode = true;
   }
   
   override protected function createVariableReference() : void
   {
      super.createVariableReference();
   }
   
   override public function set data(param1:Object) : void
   {
      super.data = param1;
      $("wenben1",this,true).attr("text",param1.mingci);
      $("wenben2",this,true).attr("text",param1.name);
      $("wenben3",this,true).attr("text",param1.num);
   }
}
