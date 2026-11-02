package com.tgame.shell.view.components.neiligaishi
{
   import com.asQuery.$;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.utils.UITools;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import game.display.Container;
   import game.display.List;
   import game.skin.NeiLiGaiShi20171228Skin;
   import game.utils.SkinTools;
   
   public class YNNeiligaishiPanel extends BasePanel
   {
      
      public static const NEILIGAISHI_TIJIAOWUPIN:String = "NEILIGAISHI_TIJIAOWUPIN";
      
      public static const NEILIGAISHI_LINGQU:String = "NEILIGAISHI_LINGQU";
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var list:List;
      
      private var _container:Container;
      
      private var jiantouXY:Point;
      
      private var _shuoming:YNNeiligaishiShuoMingPanel;
      
      public function YNNeiligaishiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(NeiLiGaiShi20171228Skin.skin,"neigonggaishi");
         this._container = new Container();
         addChild(this._container);
         this._container.x = -147;
         this._container.y = -135;
         this.arr1 = [[713176,5],[713176,4],[713176,3],[713176,2],[713176,2],[713176,3],[713176,4],[713176,5]];
         this.init();
      }
      
      override protected function createVariableReference() : void
      {
         this.list = getChildByName("liebiao1") as List;
         this.list.ItemClass = ListElement;
         this.list.verticalGap = 8;
         this.jiantouXY = new Point($("jiantou",this,true).getAttr("x"),$("jiantou",this,true).getAttr("y"));
      }
      
      private function init() : void
      {
         $("wanfashuominganniu tijiaoanniu anniu1 anniu2 anniu3",this,true).click(this.clickHanlder);
         $("guanbi",this,true).click(this.onClick);
         this.setDataGoods(this.arr1);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         switch(param1.target.name)
         {
            case "wanfashuominganniu":
               if(!Fun.isVisible(this.shuoming))
               {
                  UITools.showPanel(this.shuoming);
               }
               break;
            case "tijiaoanniu":
               dispatchEvent(new BaseEvent(NEILIGAISHI_TIJIAOWUPIN));
               break;
            case "anniu1":
               dispatchEvent(new BaseEvent(NEILIGAISHI_LINGQU,"",1));
               break;
            case "anniu2":
               dispatchEvent(new BaseEvent(NEILIGAISHI_LINGQU,"",3));
               break;
            case "anniu3":
               dispatchEvent(new BaseEvent(NEILIGAISHI_LINGQU,"",2));
         }
      }
      
      private function setDataGoods(param1:Array) : void
      {
         var _loc2_:Goods = null;
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.arr1.length)
         {
            _loc2_ = new Goods(param1[_loc3_][0]);
            _loc2_.count = param1[_loc3_][1];
            this.item = new ItemFace(_loc2_);
            if(_loc3_ < 4)
            {
               this.item.x = 262 + 45 * (_loc3_ - 1);
            }
            else
            {
               this.item.x = 306 + 45 * (_loc3_ - 1);
            }
            this.item.y = 512;
            this._container.addChild(this.item);
            _loc3_++;
         }
      }
      
      public function setData(param1:Object) : void
      {
         this.list.DataSource = param1.arr;
         $("qinglongduishuzhi",this,true).attr("text",param1.qinglongdui);
         $("xuanwuduishuzhi",this,true).attr("text",param1.xuanwudui);
         $("shuliangwenben1",this,true).attr("text",param1.ziji);
         this.jiantouPoint(param1.qinglongdui - param1.xuanwudui);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function jiantouPoint(param1:int) : void
      {
         var _loc2_:Number = 364 / 200;
         if(param1 > 0)
         {
            if(param1 >= 100)
            {
               $("jiantou",this,true).attr("x",66);
            }
            else
            {
               $("jiantou",this,true).attr("x",this.jiantouXY.x - param1 * _loc2_);
            }
         }
         else if(param1 < 0)
         {
            if(param1 <= -100)
            {
               $("jiantou",this,true).attr("x",430);
            }
            else
            {
               $("jiantou",this,true).attr("x",this.jiantouXY.x + Math.abs(param1) * _loc2_);
            }
         }
         else if(param1 == 0)
         {
            $("jiantou",this,true).attr("x",this.jiantouXY.x);
         }
      }
      
      private function get shuoming() : YNNeiligaishiShuoMingPanel
      {
         if(this._shuoming == null)
         {
            this._shuoming = new YNNeiligaishiShuoMingPanel();
         }
         return this._shuoming;
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
      $("wenben3",this,true).attr("text",param1.jifen);
   }
}
