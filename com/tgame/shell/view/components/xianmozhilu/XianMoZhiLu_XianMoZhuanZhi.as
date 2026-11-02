package com.tgame.shell.view.components.xianmozhilu
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class XianMoZhiLu_XianMoZhuanZhi extends Sprite
   {
      
      public static const UI_XIANMOZHUANZHI_CLICK:String = "UI_XIANMOZHUANZHI_CLICK";
      
      private var tz:Sprite;
      
      private var txtSkill1:FTextArea;
      
      private var txtSkill2:FTextArea;
      
      private var clickSpr1:Sprite;
      
      private var clickSpr2:Sprite;
      
      private var xuankuang:DisplayObject;
      
      private var zhuanzhiType:int = 1;
      
      private var weiKaiQiBtn:NewSkinButton;
      
      public function XianMoZhiLu_XianMoZhuanZhi()
      {
         var bg1:DisplayObject;
         var bg2:DisplayObject;
         var bg3:DisplayObject;
         var closeBtn:NewSkinButton;
         var str1:String;
         var str2:String;
         var bg4:MovieClip = null;
         super();
         bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/bgzz.swf");
         addChild(bg1);
         bg2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/xianzu.swf");
         bg2.x = 215;
         bg2.y = 63;
         addChild(bg2);
         bg3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/mozu.swf");
         bg3.x = 620;
         bg3.y = 63;
         addChild(bg3);
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            bg4 = _loc2_.content as MovieClip;
            bg4.x = -260;
            bg4.y = -36;
            addChild(bg4);
         },null,false,GameConfig.fileBaseFolder + "res/ui/xianmozhilu/effect1.swf");
         this.tz = new Sprite();
         this.tz.graphics.beginFill(16711680,0);
         this.tz.graphics.drawRect(0,0,900,60);
         this.tz.graphics.endFill();
         this.tz.width = 900;
         this.tz.height = 63;
         this.tz.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDowns);
         addEventListener(MouseEvent.MOUSE_UP,this.mouseReleaseds);
         addChild(this.tz);
         this.clickSpr1 = new Sprite();
         this.clickSpr1.graphics.beginFill(16711680,0);
         this.clickSpr1.graphics.drawRect(0,0,420,350);
         this.clickSpr1.graphics.endFill();
         this.clickSpr1.width = 420;
         this.clickSpr1.height = 350;
         this.clickSpr1.x = 10;
         this.clickSpr1.y = 100;
         this.clickSpr1.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.clickSpr1);
         this.clickSpr2 = new Sprite();
         this.clickSpr2.graphics.beginFill(16711680,0);
         this.clickSpr2.graphics.drawRect(0,0,420,350);
         this.clickSpr2.graphics.endFill();
         this.clickSpr2.width = 420;
         this.clickSpr2.height = 350;
         this.clickSpr2.x = 460;
         this.clickSpr2.y = 100;
         this.clickSpr2.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.clickSpr2);
         this.xuankuang = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/kuang.swf");
         this.xuankuang.x = 10 + 34;
         this.xuankuang.y = 100 - 45;
         addChild(this.xuankuang);
         closeBtn = new NewSkinButton();
         closeBtn.skin = "xmzl_close_Button";
         closeBtn.x = 850;
         closeBtn.y = 22;
         addChild(closeBtn);
         closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.weiKaiQiBtn = new NewSkinButton();
         this.weiKaiQiBtn.skin = "querenzhuanzhi_Button";
         this.weiKaiQiBtn.x = 370;
         this.weiKaiQiBtn.y = 500;
         addChild(this.weiKaiQiBtn);
         this.weiKaiQiBtn.toolTip = "<font color=\'" + StaticValue.RED_HTML + "\'>" + "消耗道具：仙魔转职卷轴*1" + "</font>";
         this.weiKaiQiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         str1 = "";
         str1 += "<textformat leading=\'6\'>";
         str1 += "<font color=\'StaticValue.WHITE_HTML\'>" + "    仙族技能" + "<br>" + "远程技能：追魂斩" + "<br>" + "群攻技能：神龙摆尾" + "<br>" + "增益状态：法尊守护" + "<br>" + "控制技能：剑域锁" + "<br>";
         str1 += "</textformat>";
         this.txtSkill1 = new FTextArea();
         this.txtSkill1.textColor = StaticValue.RED;
         this.txtSkill1.filters = StaticValue.filter;
         this.txtSkill1.htmlText = str1;
         this.txtSkill1.x = 190;
         this.txtSkill1.y = 450;
         this.txtSkill1.width = 150;
         addChild(this.txtSkill1);
         str2 = "";
         str2 += "<textformat leading=\'6\'>";
         str2 += "<font color=\'StaticValue.WHITE_HTML\'>" + "    魔族技能" + "<br>" + "远程技能：隐龙刀" + "<br>" + "群攻技能：天凤神炎" + "<br>" + "增益状态：唤潮之佑" + "<br>" + "控制技能：清风拂尘" + "<br>";
         str2 += "</textformat>";
         this.txtSkill2 = new FTextArea();
         this.txtSkill2.textColor = StaticValue.RED;
         this.txtSkill2.filters = StaticValue.filter;
         this.txtSkill2.htmlText = str2;
         this.txtSkill2.x = 605;
         this.txtSkill2.y = 450;
         this.txtSkill2.width = 150;
         addChild(this.txtSkill2);
      }
      
      private function mouseDowns(param1:MouseEvent) : void
      {
         this.parent.setChildIndex(this,parent.numChildren - 1);
         this.startDrag(false,new Rectangle(0,0,Tools.currentStage.stageWidth,Tools.currentStage.stageHeight));
      }
      
      private function mouseReleaseds(param1:MouseEvent) : void
      {
         this.stopDrag();
      }
      
      public function onClose(param1:MouseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
            this.xuankuang.x = 10 + 34;
            this.zhuanzhiType = 1;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.clickSpr1:
               this.xuankuang.x = 10 + 34;
               this.zhuanzhiType = 1;
               break;
            case this.clickSpr2:
               this.xuankuang.x = 460;
               this.zhuanzhiType = 2;
               break;
            case this.weiKaiQiBtn:
               dispatchEvent(new BaseEvent(UI_XIANMOZHUANZHI_CLICK,"",this.zhuanzhiType));
         }
      }
   }
}

