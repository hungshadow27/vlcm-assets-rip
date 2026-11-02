package com.tgame.shell.view.components.wuyidoudizhu
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class DouDiZhuPanel extends FPanel
   {
      
      public static const UI_DOUDIZHU:String = "UI_DOUDIZHU";
      
      public static const UI_GETXUNZHANG:String = "UI_GETXUNZHANG";
      
      public static const UI_DOUDIZHU_USEITEM:String = "UI_DOUDIZHU_USEITEM";
      
      public static const UI_LOOKRANK:String = "UI_LOOKRANK";
      
      public static const UI_GETMEIREN:String = "UI_GETMEIREN";
      
      private var tf:TextFormat;
      
      private var rongyuzhi:FTextArea;
      
      private var lingquBtn:SecondButton;
      
      private var paihangBtn:SecondButton;
      
      private var kuang:Bitmap;
      
      private var jinengSpr:Sprite;
      
      public function DouDiZhuPanel()
      {
         var _loc1_:FCanvas = null;
         var _loc3_:FTextArea = null;
         var _loc4_:FTextArea = null;
         super();
         this.titleText = LanResManager.getLanCommonTextWords("五一斗地主");
         this.showCloseButton = true;
         this.skin = "panel_btn";
         this.dragAble = true;
         width = 370 + 30 + 60 + 100;
         height = 403 + 2 + 2;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tf = new TextFormat();
         this.tf.align = "center";
         _loc1_ = new FCanvas();
         _loc1_.skin = "box";
         addChild(_loc1_);
         _loc1_.x = 228 + 10;
         _loc1_.y = 2;
         _loc1_.width = 300 + 11;
         _loc1_.height = 70;
         _loc1_ = new FCanvas();
         _loc1_.skin = "box";
         addChild(_loc1_);
         _loc1_.x = 228 + 10;
         _loc1_.y = 70;
         _loc1_.width = 300 + 11;
         _loc1_.height = 403 + 2 - 70 - 73;
         var _loc2_:DisplayObject = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/doudizhu/bg.jpg",227,328);
         _loc2_.x = 10;
         _loc2_.y = 2;
         addChild(_loc2_);
         _loc3_ = new FTextArea();
         _loc3_.wordWrap = true;
         _loc3_.multiline = true;
         _loc3_.x = 250;
         _loc3_.y = 20;
         _loc3_.width = 250 + 50;
         _loc3_.height = 40;
         _loc3_.htmlText = "<font color =\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("剥削农民的黑心地主又来啦，小伙伴们快快团结起来！打倒黑心地主，领取属于自己的荣誉奖励！") + "</font>";
         addChild(_loc3_);
         this.rongyuzhi = new FTextArea();
         addChild(this.rongyuzhi);
         this.rongyuzhi.width = 300;
         this.rongyuzhi.height = 50;
         this.rongyuzhi.x = 250;
         this.rongyuzhi.y = 100;
         this.rongyuzhi.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("斗地主荣誉值达到998可领取") + "<br>" + LanResManager.getLanCommonTextWords("当前荣誉值") + "****</font>";
         _loc4_ = new FTextArea();
         _loc4_.wordWrap = true;
         _loc4_.multiline = true;
         _loc4_.x = 250;
         _loc4_.y = 200 - 17;
         _loc4_.filters = StaticValue.filter;
         _loc4_.width = 300;
         _loc4_.height = 150;
         _loc4_.htmlText = "<font color =\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动时间：") + "<br>" + LanResManager.getLanCommonTextWords("5月1号至5月3号22：00") + "<br>" + LanResManager.getLanCommonTextWords("活动内容：") + "<br>" + LanResManager.getLanCommonTextWords("活动期间，襄阳城1.2.3线每隔30分钟刷新一批黑心地主，击杀后可以获得爱心小红花；小红花可对玩家使用，对方可以获得斗地主荣誉点，若互为异性，则荣誉点奖励翻倍哟！荣誉值排行前十玩家可以获得永久称号与永久大红花特殊奖励！") + "</font>";
         addChild(_loc4_);
         this.lingquBtn = new SecondButton();
         addChild(this.lingquBtn);
         this.lingquBtn.x = 240 + 50 + 150;
         this.lingquBtn.y = 100 + 60;
         this.lingquBtn.label = LanResManager.getLanCommonTextWords("领取勋章");
         this.lingquBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.paihangBtn = new SecondButton();
         addChild(this.paihangBtn);
         this.paihangBtn.x = 240 + 50 + 150;
         this.paihangBtn.y = 100 + 30 + 60;
         this.paihangBtn.label = LanResManager.getLanCommonTextWords("查看排行榜");
         this.paihangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 250 + 220;
         this.kuang.y = 40 + 60;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 250 + 2 + 220;
         this.jinengSpr.y = 40 + 2 + 60;
         addChild(this.jinengSpr);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.lingquBtn:
               dispatchEvent(new BaseEvent(UI_GETXUNZHANG));
               break;
            case this.paihangBtn:
               dispatchEvent(new BaseEvent(UI_LOOKRANK,"",1));
         }
      }
      
      private function setItem(param1:Boolean) : void
      {
         var _loc3_:ItemFace = null;
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc2_:Goods = new Goods(370542);
         _loc3_ = new ItemFace(_loc2_);
         if(!param1)
         {
            _loc3_.filters = Tools.blackWhiteFilter;
         }
         else
         {
            _loc3_.filters = [];
         }
         this.jinengSpr.addChild(_loc3_);
      }
      
      public function update(param1:int, param2:Boolean) : void
      {
         this.rongyuzhi.htmlText = "<font size = \'16\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("斗地主荣誉值达到500可领取") + "<br>" + LanResManager.getLanCommonTextWords("当前荣誉值") + param1 + "</font>";
         if(param2)
         {
            this.lingquBtn.enabled = true;
         }
         else
         {
            this.lingquBtn.enabled = false;
         }
         this.setItem(param2);
      }
   }
}

