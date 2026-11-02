package com.tgame.shell.view.components.zhanhun
{
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.McBaseItem;
   import com.tgame.shell.view.components.ZhanHunPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.utils.Dictionary;
   
   public class DuihuanZhanhunCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var shuliang:FTextArea;
      
      private var container:Sprite;
      
      private var zhanHunArr:Array;
      
      private var dictZhanHun:Dictionary;
      
      public function DuihuanZhanhunCanvas()
      {
         super();
         var _loc1_:* = new FTextArea();
         addChild(_loc1_);
         _loc1_.multiline = true;
         _loc1_.autoSize = TextFieldAutoSize.LEFT;
         _loc1_.wordWrap = true;
         _loc1_.width = 400;
         _loc1_.height = 100;
         _loc1_.x = 20;
         _loc1_.y = 330 - 55 + 15 + 2 + 9;
         _loc1_.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击兑换按钮，可以使用战魂宝石兑换对应的战魂。") + "<br>" + LanResManager.getLanCommonTextWords("兑换战魂，需要2颗战魂宝石。") + "</font>";
         this.shuliang = new FTextArea();
         addChild(this.shuliang);
         this.shuliang.multiline = true;
         this.shuliang.autoSize = TextFieldAutoSize.LEFT;
         this.shuliang.wordWrap = true;
         this.shuliang.width = 400;
         this.shuliang.height = 100;
         this.shuliang.x = 547 - 125 - 385 + 230;
         this.shuliang.y = 330 - 55 - 21 + 13;
         this.shuliang.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("战魂宝石数量") + "：</font>";
         this.container = new Sprite();
         addChild(this.container);
         this.zhanHunArr = new Array();
         this.dictZhanHun = new Dictionary();
      }
      
      private function onComItemFace(param1:DisplayObject) : void
      {
         if(param1 != null && Boolean(param1.parent))
         {
            param1.parent.removeChild(param1);
            if(param1 is ItemFace)
            {
               (param1 as ItemFace).destroy();
            }
         }
      }
      
      private function onDuiHuanClick(param1:MouseEvent) : void
      {
         var _loc2_:String = param1.target.name;
         var _loc3_:int = Number(_loc2_);
         this.$parent.dispatchEvent(new BaseEvent(ZhanHunPanel.UI_DUIHUANZHANHUNCANVAS_DUIHUAN,"",_loc3_));
      }
      
      private function addZhanHunToStage(param1:int, param2:Object) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc3_ = 27 - 9 + 50 - 15 + param1 % 5 * 110;
         _loc4_ = 20 + 12 - 9 - 10 + Math.floor(param1 / 5) * 120;
         var _loc5_:Sprite = new Sprite();
         var _loc6_:McBaseItem = new McBaseItem(param2.goodid);
         _loc6_.daojuId = param2.goodid;
         _loc6_.name = param2.name;
         _loc6_.dengji = param2.dengji;
         _loc6_.quality = param2.type;
         _loc6_.miaoshu = param2.miaoshu;
         _loc6_.jiage = param2.price;
         var _loc7_:ItemFace = new ItemFace(_loc6_);
         _loc7_.name = "" + param2.id;
         _loc7_.setMcName(true,true);
         _loc7_.x = 5;
         _loc7_.y = 3.5;
         _loc5_.addChildAt(_loc7_,0);
         var _loc8_:SmallButton = new SmallButton();
         _loc8_.label = LanResManager.getLanCommonTextWords("兑换");
         _loc8_.name = param2.goodid;
         _loc5_.addChild(_loc8_);
         _loc8_.x = 20;
         _loc8_.y = 65 + 20;
         _loc8_.addEventListener(MouseEvent.CLICK,this.onDuiHuanClick);
         _loc5_.x = _loc3_;
         _loc5_.y = _loc4_;
         this.container.addChild(_loc5_);
         this.dictZhanHun[param2.id] = _loc5_;
      }
      
      public function setBaoShi(param1:int) : void
      {
         this.shuliang.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("战魂宝石数量：") + param1 + "</font>";
      }
      
      private function removeZhanHun() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:DisplayObject = null;
         while(this.container.numChildren > 0)
         {
            _loc1_ = this.container.removeChildAt(0);
            if(_loc1_ is Sprite)
            {
               _loc2_ = (_loc1_ as Sprite).getChildAt(0);
               if(_loc2_ is ItemFace)
               {
                  this.onComItemFace(_loc2_);
               }
            }
         }
      }
      
      public function setZhanHun(param1:Array) : void
      {
         this.removeZhanHun();
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         this.dictZhanHun = new Dictionary();
         this.zhanHunArr = new Array();
         this.zhanHunArr = param1;
         var _loc2_:* = 0;
         while(_loc2_ < param1.length)
         {
            this.addZhanHunToStage(_loc2_,param1[_loc2_]);
            _loc2_++;
         }
      }
   }
}

