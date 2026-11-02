package com.tgame.shell.view.components.duanwujie2015
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.laoDongjie.LaoDongJieRankPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class DuanWuJie2015Panel extends FPanel
   {
      
      public static const UI_DUANWUJIE2015_GETJIANGLI:String = "UI_DUANWUJIE2015_GETJIANGLI";
      
      public static const UI_DUANWUJIE2015_GETPAIHANGJIANGLI:String = "UI_DUANWUJIE2015_GETPAIHANGJIANGLI";
      
      public static const UI_DUANWUJIE2015_PAIHANG:String = "UI_DUANWUJIE2015_PAIHANG";
      
      public static const UI_DUANWUJIE2015_GETTIJIAO:String = "UI_DUANWUJIE2015_GETTIJIAO";
      
      private var tf:TextFormat;
      
      private var bg:DisplayObject;
      
      private var wenben:DisplayObject;
      
      private var jiFen:FTextArea;
      
      private var wb:FTextArea;
      
      private var jiangchiSpr:Sprite;
      
      private var fengSpr:Sprite;
      
      private var jiangliBtn:SecondButton;
      
      private var paihang:LaoDongJieRankPanel;
      
      private var tiJiaoBtn:SecondButton;
      
      private var bakeZongzi:FTextArea;
      
      private var zongZongzi:FTextArea;
      
      private var tijiaoZongzi:FTextArea;
      
      private var shuliangText:FTextInput;
      
      private var addBtn:FSimpleButton;
      
      private var subBtn:FSimpleButton;
      
      private var good:Goods;
      
      private var goodCount:int = 0;
      
      private var dituArr:Array;
      
      private var dituSpr:Sprite;
      
      private var xiangyang:FTextArea;
      
      private var wanfashuoming:FTextArea;
      
      public function DuanWuJie2015Panel()
      {
         var img:F9GridBitmap;
         this.dituArr = [];
         super();
         this.titleText = LanResManager.getLanCommonTextWords("怪物攻城");
         this.showCloseButton = true;
         this.skin = "panel";
         this.dragAble = true;
         width = 635;
         height = 560;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/guaiwugongcheng/bg2.swf");
         this.bg.x = 10;
         this.bg.y = 2;
         addChild(this.bg);
         this.wenben = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/guaiwugongcheng/wenben2.swf");
         this.wenben.x = 20;
         this.wenben.y = 135;
         addChild(this.wenben);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.jiFen = new FTextArea();
         this.jiFen.wordWrap = true;
         this.jiFen.multiline = true;
         this.jiFen.textColor = StaticValue.GREEN;
         this.jiFen.x = 22 + 55;
         this.jiFen.y = 360 - 23 + 85;
         this.jiFen.width = 250 + 50;
         this.jiFen.height = 40;
         this.jiFen.htmlText = "100000";
         addChild(this.jiFen);
         this.jiangchiSpr = new Sprite();
         this.jiangchiSpr.x = 32;
         this.jiangchiSpr.y = 473;
         addChild(this.jiangchiSpr);
         this.fengSpr = new Sprite();
         this.fengSpr.x = 0;
         this.fengSpr.y = 0;
         this.jiangchiSpr.addChild(this.fengSpr);
         ToolTips.createToolTips(this.fengSpr,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("奖励即将开启");
            return _loc1_ + "</textformat>";
         });
         this.dituSpr = new Sprite();
         addChild(this.dituSpr);
         this.jiangliBtn = new SecondButton();
         addChild(this.jiangliBtn);
         this.jiangliBtn.x = 515;
         this.jiangliBtn.y = 480;
         this.jiangliBtn.label = LanResManager.getLanCommonTextWords("领取");
         this.jiangliBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.bakeZongzi = new FTextArea();
         this.bakeZongzi.x = 197;
         this.bakeZongzi.y = 346;
         this.bakeZongzi.textColor = StaticValue.WHITE;
         this.bakeZongzi.width = 120;
         this.bakeZongzi.height = 20;
         this.bakeZongzi.text = "0";
         addChild(this.bakeZongzi);
         this.zongZongzi = new FTextArea();
         this.zongZongzi.x = 467;
         this.zongZongzi.y = 371;
         this.zongZongzi.textColor = StaticValue.WHITE;
         this.zongZongzi.width = 140;
         this.zongZongzi.height = 20;
         this.zongZongzi.text = "10000000";
         addChild(this.zongZongzi);
         this.xiangyang = new FTextArea();
         this.xiangyang.defaultTextFormat = this.tf;
         this.xiangyang.x = 273;
         this.xiangyang.y = 270;
         this.xiangyang.width = 95;
         this.xiangyang.height = 20;
         this.xiangyang.text = LanResManager.getLanCommonTextWords("已击杀");
         addChild(this.xiangyang);
         this.wanfashuoming = new FTextArea();
         this.wanfashuoming.x = 555;
         this.wanfashuoming.y = 390;
         this.wanfashuoming.textColor = StaticValue.GREEN;
         this.wanfashuoming.width = 120;
         this.wanfashuoming.height = 20;
         this.wanfashuoming.htmlText = LanResManager.getLanCommonTextWords("玩法说明");
         addChild(this.wanfashuoming);
         ToolTips.createToolTips(this.wanfashuoming,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("活动期间野外打怪有几率掉落魔气。") + "<br>" + LanResManager.getLanCommonTextWords("活动期间每天的15点会在一线野外地图中刷新攻城魔兵，每张野外地图内只刷新一") + "<br>" + LanResManager.getLanCommonTextWords("只攻城魔兵，击杀后会掉落大量奖励，当成功击杀16个地图的攻城魔兵时，襄阳") + "<br>" + LanResManager.getLanCommonTextWords("城内将出现攻城魔王，击杀魔王将掉落大量奖励。(所有奖励无指定主人，所有玩家均可捡取)") + "<br>" + "<br>" + LanResManager.getLanCommonTextWords("提交魔气会在排行榜中排行") + "<br>";
            return _loc1_ + "</textformat>";
         });
         img = Tools.get9GridBitmpByName("inputBg");
         addChild(img);
         img.width = 60;
         img.x = 245;
         img.y = 370;
         this.shuliangText = new FTextInput();
         this.shuliangText.textColor = 16777215;
         this.shuliangText.restrict = "0-9";
         this.shuliangText.defaultTextFormat = this.tf;
         this.shuliangText.border = false;
         addChild(this.shuliangText);
         this.shuliangText.x = 245;
         this.shuliangText.y = 372;
         this.shuliangText.width = 60;
         this.shuliangText.height = 20;
         this.addBtn = new FSimpleButton();
         this.addBtn.skin = "sumButton";
         addChild(this.addBtn);
         this.addBtn.x = this.shuliangText.x - 20;
         this.addBtn.y = this.shuliangText.y;
         this.addBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.subBtn = new FSimpleButton();
         this.subBtn.skin = "subButton";
         addChild(this.subBtn);
         this.subBtn.x = this.shuliangText.x + 60;
         this.subBtn.y = this.shuliangText.y;
         this.subBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tiJiaoBtn = new SecondButton();
         addChild(this.tiJiaoBtn);
         this.tiJiaoBtn.x = img.x;
         this.tiJiaoBtn.y = img.y + 22;
         this.tiJiaoBtn.label = LanResManager.getLanCommonTextWords("提交魔气");
         this.tiJiaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function initDitu(param1:Array) : void
      {
         var _loc3_:FTextArea = null;
         while(this.dituSpr.numChildren > 0)
         {
            this.dituSpr.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = new FTextArea();
            if(param1[_loc2_] == 0)
            {
               _loc3_.text = LanResManager.getLanCommonTextWords("等待刷新");
               _loc3_.textColor = StaticValue.WHITE;
            }
            else if(param1[_loc2_] == 1)
            {
               _loc3_.text = LanResManager.getLanCommonTextWords("已刷新");
               _loc3_.textColor = StaticValue.GREEN;
            }
            else if(param1[_loc2_] == 2)
            {
               _loc3_.text = LanResManager.getLanCommonTextWords("已击杀");
               _loc3_.textColor = StaticValue.RED;
            }
            _loc3_.x = 147 + int(_loc2_ / 8) * 400;
            _loc3_.y = 160 + _loc2_ % 8 * 22;
            this.dituSpr.addChild(_loc3_);
            this.dituArr.push(_loc3_);
            _loc2_++;
         }
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
            case this.jiangliBtn:
               dispatchEvent(new BaseEvent(UI_DUANWUJIE2015_GETJIANGLI));
               break;
            case this.subBtn:
               if(int(this.shuliangText.text) > 1)
               {
                  this.shuliangText.text = String(int(this.shuliangText.text) - 1);
               }
               break;
            case this.addBtn:
               if(int(this.shuliangText.text) < this.goodCount)
               {
                  this.shuliangText.text = String(int(this.shuliangText.text) + 1);
               }
               break;
            case this.tiJiaoBtn:
               if(this.shuliangText.text != "")
               {
                  dispatchEvent(new BaseEvent(UI_DUANWUJIE2015_GETTIJIAO,"",int(this.shuliangText.text)));
               }
         }
      }
      
      public function update(param1:int, param2:Array, param3:Boolean, param4:Array, param5:int, param6:int) : void
      {
         var _loc8_:FTextArea = null;
         var _loc9_:FTextArea = null;
         var _loc10_:Goods = null;
         var _loc11_:ItemFace = null;
         while(this.jiangchiSpr.numChildren > 0)
         {
            this.jiangchiSpr.removeChildAt(0);
         }
         this.initDitu(param4);
         var _loc7_:int = 0;
         while(_loc7_ < param2.length)
         {
            _loc8_ = new FTextArea();
            _loc8_.htmlText = "<font  color =\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("魔气数：") + "</font>";
            _loc8_.x = _loc7_ * 49 - 2;
            _loc8_.y = -35;
            _loc9_ = new FTextArea();
            this.jiangchiSpr.addChild(_loc9_);
            _loc9_.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'>" + param2[_loc7_].dianshu + "</font>";
            _loc9_.width = 40;
            _loc9_.height = 20;
            _loc9_.x = _loc7_ * 49 - 2;
            _loc9_.y = -18;
            _loc10_ = new Goods(param2[_loc7_].id);
            _loc10_.count = param2[_loc7_].count;
            _loc11_ = new ItemFace(_loc10_);
            _loc11_.x = _loc7_ * 49;
            _loc11_.y = 0;
            if(param2[_loc7_].isLingqu)
            {
               _loc11_.filters = Tools.blackWhiteFilter;
            }
            else
            {
               _loc11_.filters = [];
            }
            this.jiangchiSpr.addChild(_loc11_);
            _loc7_++;
         }
         this.jiangliBtn.enabled = param3;
         this.bakeZongzi.htmlText = "<font  color =\'" + StaticValue.YELLOW_HTML + "\'>" + param1 + "</font>";
         this.goodCount = param1;
         this.jiFen.htmlText = "<font  color =\'" + StaticValue.YELLOW_HTML + "\'>" + param5 + "</font>";
         this.zongZongzi.htmlText = "<font  color =\'" + StaticValue.YELLOW_HTML + "\'>" + param5 + "</font>";
         if(param6 == 0)
         {
            this.xiangyang.text = LanResManager.getLanCommonTextWords("等待刷新");
            this.xiangyang.textColor = StaticValue.WHITE;
         }
         else if(param6 == 1)
         {
            this.xiangyang.text = LanResManager.getLanCommonTextWords("已刷新");
            this.xiangyang.textColor = StaticValue.GREEN;
         }
         else if(param6 == 2)
         {
            this.xiangyang.text = LanResManager.getLanCommonTextWords("已击杀");
            this.xiangyang.textColor = StaticValue.RED;
         }
      }
      
      public function setPaihang(param1:int, param2:int, param3:Array, param4:Boolean, param5:int) : void
      {
         if(!this.paihang)
         {
            this.paihang = new LaoDongJieRankPanel();
            this.paihang.$parent = this;
         }
         this.paihang.x = (GameConfig.sceneWidth - this.paihang.width) / 2;
         this.paihang.y = (GameConfig.sceneHeight - this.paihang.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this.paihang);
         this.paihang.x = 633;
         this.paihang.y = -30 - 2;
         this.paihang.dragAble = false;
         addChild(this.paihang);
         this.paihang.updateRank(param1,param2,param3,param4,param5);
      }
   }
}

