package com.tgame.shell.view.components.youhuizhouqi
{
   import com.asQuery.$;
   import com.fireice.util.Tools;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import game.skin.YouHuiZhouQiSkin;
   import game.utils.SkinTools;
   
   public class YN2017YouHuiZhouQiPanel extends BasePanel
   {
      
      public static const LINGQU:String = "LINGQU";
      
      private var skill:Goods;
      
      private var item:ItemFace;
      
      private var itemSp:Sprite;
      
      private var onlyId:Array = [];
      
      public function YN2017YouHuiZhouQiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(YouHuiZhouQiSkin.skin,"youhuizhouqi");
      }
      
      override protected function createVariableReference() : void
      {
         $("YBZLGBAN",this,true).click(this.gotoClose);
         $("DFZQLQAN1 DFZQLQAN2 DFZQLQAN3 DFZQLQAN4 DFZQLQAN5 DFZQLQAN6 DFZQLQAN7",this,true).click(this.onClick);
         this.itemSp = new Sprite();
         this.itemSp.x = -5;
         this.itemSp.y = 234;
         this.addChild(this.itemSp);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("N");
         var _loc3_:int = int(_loc2_[1]) - 1;
         dispatchEvent(new BaseEvent(LINGQU,null,int(this.onlyId[_loc3_])));
      }
      
      public function setData(param1:Object) : void
      {
         this.onlyId = [];
         while(this.itemSp.numChildren > 0)
         {
            this.itemSp.removeChildAt(0);
         }
         $("shijian",this,true).attr("text",param1.time);
         var _loc2_:int = 0;
         while(_loc2_ < 7)
         {
            this.onlyId.push(param1.ary[_loc2_].onlyId);
            if(param1.ary[_loc2_].isLingqu == 0)
            {
               $("DFZQLQAN" + int(_loc2_ + 1),this,true).attr("mouseEnabled",false).attr("mouseChildren",false).attr("filters",Tools.blackWhiteFilter);
            }
            else
            {
               $("DFZQLQAN" + int(_loc2_ + 1),this,true).attr("mouseEnabled",true).attr("mouseChildren",true).attr("filters",[]);
            }
            $("wenben" + int(_loc2_ + 1),this,true).attr("text",param1.ary[_loc2_].shuzhi);
            this.skill = new Goods(param1.ary[_loc2_].itemId);
            this.item = new ItemFace(this.skill,65,65);
            this.item.count = param1.ary[_loc2_].itemNum;
            this.item.x = 50 + _loc2_ * 91;
            this.item.y = 100;
            this.itemSp.addChild(this.item);
            _loc2_++;
         }
      }
      
      private function gotoClose(param1:MouseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

