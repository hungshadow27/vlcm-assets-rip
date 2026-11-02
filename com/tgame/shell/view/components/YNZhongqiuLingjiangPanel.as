package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class YNZhongqiuLingjiangPanel extends FPanel
   {
      
      public static const UI_YN_ZHONGQIULINGJIANG_CLICK:String = "UI_YN_ZHONGQIULINGJIANG_CLICK";
      
      private var ft:FTextArea;
      
      private var bg:DisplayObject;
      
      private var btn1:SecondButton;
      
      private var btn2:SecondButton;
      
      private var btn3:SecondButton;
      
      private var ftNum:FTextArea;
      
      private var ft_chengji1:FTextArea;
      
      private var ft_chengji2:FTextArea;
      
      private var ft_chengji3:FTextArea;
      
      private var ft_tiaojian1:FTextArea;
      
      private var ft_tiaojian2:FTextArea;
      
      private var ft_tiaojian3:FTextArea;
      
      private var ft_jiangli1:FTextArea;
      
      private var ft_jiangli2:FTextArea;
      
      private var ft_jiangli3:FTextArea;
      
      public function YNZhongqiuLingjiangPanel()
      {
         super();
         width = 690;
         height = 370;
         dragAble = true;
         showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("三年奖励");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynChristmas/bg.swf");
         this.bg.x = 10;
         this.bg.y = 2;
         addChild(this.bg);
         this.ft = new FTextArea();
         this.ft.textColor = StaticValue.BlUE20;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("成绩");
         this.ft.width = 50;
         this.ft.height = 20;
         this.ft.x = 250;
         this.ft.y = 5;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.textColor = StaticValue.BlUE20;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("条件");
         this.ft.width = 50;
         this.ft.height = 20;
         this.ft.x = 360;
         this.ft.y = 5;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.textColor = StaticValue.BlUE20;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("奖励");
         this.ft.width = 50;
         this.ft.height = 20;
         this.ft.x = 470;
         this.ft.y = 5;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.textColor = StaticValue.BlUE20;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("状态");
         this.ft.width = 50;
         this.ft.height = 20;
         this.ft.x = 585;
         this.ft.y = 5;
         addChild(this.ft);
         this.ft_chengji1 = new FTextArea();
         this.ft_chengji1.textColor = StaticValue.WHITE;
         this.ft_chengji1.htmlText = LanResManager.getLanCommonTextWords("第一");
         this.ft_chengji1.width = 100;
         this.ft_chengji1.height = 20;
         this.ft_chengji1.x = 235;
         this.ft_chengji1.y = 60;
         addChild(this.ft_chengji1);
         this.ft_tiaojian1 = new FTextArea();
         this.ft_tiaojian1.textColor = StaticValue.GREEN;
         this.ft_tiaojian1.htmlText = LanResManager.getLanCommonTextWords("蜡烛") + "*8888";
         this.ft_tiaojian1.width = 120;
         this.ft_tiaojian1.height = 20;
         this.ft_tiaojian1.x = 340;
         this.ft_tiaojian1.y = 60;
         addChild(this.ft_tiaojian1);
         this.ft_jiangli1 = new FTextArea();
         this.ft_jiangli1.textColor = StaticValue.WHITE;
         this.ft_jiangli1.htmlText = LanResManager.getLanCommonTextWords("精良蛋糕") + "*1（" + LanResManager.getLanCommonTextWords("绑定") + "）";
         this.ft_jiangli1.width = 120;
         this.ft_jiangli1.height = 20;
         this.ft_jiangli1.x = 440 - 15;
         this.ft_jiangli1.y = 60;
         addChild(this.ft_jiangli1);
         this.btn1 = new SecondButton();
         this.btn1.label = LanResManager.getLanCommonTextWords("领奖");
         this.btn1.x = 555;
         this.btn1.y = 60;
         this.btn1.enabled = false;
         this.btn1.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn1);
         this.ft_chengji2 = new FTextArea();
         this.ft_chengji2.textColor = StaticValue.WHITE;
         this.ft_chengji2.htmlText = LanResManager.getLanCommonTextWords("第二");
         this.ft_chengji2.width = 100;
         this.ft_chengji2.height = 20;
         this.ft_chengji2.x = 235;
         this.ft_chengji2.y = 150;
         addChild(this.ft_chengji2);
         this.ft_tiaojian2 = new FTextArea();
         this.ft_tiaojian2.textColor = StaticValue.GREEN;
         this.ft_tiaojian2.htmlText = LanResManager.getLanCommonTextWords("蜡烛") + "*18888";
         this.ft_tiaojian2.width = 120;
         this.ft_tiaojian2.height = 20;
         this.ft_tiaojian2.x = 340;
         this.ft_tiaojian2.y = 150;
         addChild(this.ft_tiaojian2);
         this.ft_jiangli2 = new FTextArea();
         this.ft_jiangli2.textColor = StaticValue.WHITE;
         this.ft_jiangli2.htmlText = LanResManager.getLanCommonTextWords("极品蛋糕") + "*1（" + LanResManager.getLanCommonTextWords("绑定") + "）";
         this.ft_jiangli2.width = 120;
         this.ft_jiangli2.height = 20;
         this.ft_jiangli2.x = 440 - 15;
         this.ft_jiangli2.y = 150;
         addChild(this.ft_jiangli2);
         this.btn2 = new SecondButton();
         this.btn2.label = LanResManager.getLanCommonTextWords("领奖");
         this.btn2.x = 555;
         this.btn2.y = 150;
         this.btn2.enabled = false;
         this.btn2.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn2);
         this.ft_chengji3 = new FTextArea();
         this.ft_chengji3.textColor = StaticValue.WHITE;
         this.ft_chengji3.htmlText = LanResManager.getLanCommonTextWords("第三");
         this.ft_chengji3.width = 100;
         this.ft_chengji3.height = 20;
         this.ft_chengji3.x = 235;
         this.ft_chengji3.y = 240;
         addChild(this.ft_chengji3);
         this.ft_tiaojian3 = new FTextArea();
         this.ft_tiaojian3.textColor = StaticValue.GREEN;
         this.ft_tiaojian3.htmlText = LanResManager.getLanCommonTextWords("蜡烛") + "*28888";
         this.ft_tiaojian3.width = 120;
         this.ft_tiaojian3.height = 20;
         this.ft_tiaojian3.x = 340;
         this.ft_tiaojian3.y = 240;
         addChild(this.ft_tiaojian3);
         this.ft_jiangli3 = new FTextArea();
         this.ft_jiangli3.textColor = StaticValue.WHITE;
         this.ft_jiangli3.htmlText = LanResManager.getLanCommonTextWords("三年蛋糕") + "*1（" + LanResManager.getLanCommonTextWords("绑定") + "）";
         this.ft_jiangli3.width = 120;
         this.ft_jiangli3.height = 20;
         this.ft_jiangli3.x = 440 - 15;
         this.ft_jiangli3.y = 240;
         addChild(this.ft_jiangli3);
         this.btn3 = new SecondButton();
         this.btn3.label = LanResManager.getLanCommonTextWords("领奖");
         this.btn3.x = 555;
         this.btn3.y = 240;
         this.btn3.enabled = false;
         this.btn3.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn3);
         this.ft = new FTextArea();
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("本服已经拥有数量：");
         this.ft.width = 200;
         this.ft.height = 20;
         this.ft.x = 20;
         this.ft.y = 300;
         addChild(this.ft);
         this.ftNum = new FTextArea();
         this.ftNum.textColor = StaticValue.BlUE20;
         this.ftNum.htmlText = "0";
         this.ftNum.width = 50;
         this.ftNum.height = 20;
         this.ftNum.x = 180;
         this.ftNum.y = 300;
         addChild(this.ftNum);
      }
      
      private function onClick(param1:MouseEvent = null) : void
      {
         switch(param1.target)
         {
            case this.btn1:
               dispatchEvent(new BaseEvent(UI_YN_ZHONGQIULINGJIANG_CLICK,"",-1));
               break;
            case this.btn2:
               dispatchEvent(new BaseEvent(UI_YN_ZHONGQIULINGJIANG_CLICK,"",-2));
               break;
            case this.btn3:
               dispatchEvent(new BaseEvent(UI_YN_ZHONGQIULINGJIANG_CLICK,"",-3));
         }
      }
      
      public function setData(param1:int, param2:int, param3:int, param4:int) : void
      {
         if(param1 == 0)
         {
            this.btn1.label = LanResManager.getLanCommonTextWords("未达条件");
            this.btn1.enabled = false;
         }
         else if(param1 == 1)
         {
            this.btn1.label = LanResManager.getLanCommonTextWords("可领奖");
            this.btn1.enabled = true;
         }
         else
         {
            this.btn1.label = LanResManager.getLanCommonTextWords("已领取");
            this.btn1.enabled = false;
         }
         if(param2 == 0)
         {
            this.btn2.label = LanResManager.getLanCommonTextWords("未达条件");
            this.btn2.enabled = false;
         }
         else if(param2 == 1)
         {
            this.btn2.label = LanResManager.getLanCommonTextWords("可领奖");
            this.btn2.enabled = true;
         }
         else
         {
            this.btn2.label = LanResManager.getLanCommonTextWords("已领取");
            this.btn2.enabled = false;
         }
         if(param3 == 0)
         {
            this.btn3.label = LanResManager.getLanCommonTextWords("未达条件");
            this.btn3.enabled = false;
         }
         else if(param3 == 1)
         {
            this.btn3.label = LanResManager.getLanCommonTextWords("可领奖");
            this.btn3.enabled = true;
         }
         else
         {
            this.btn3.label = LanResManager.getLanCommonTextWords("已领取");
            this.btn3.enabled = false;
         }
         this.ftNum.htmlText = String(param4);
      }
      
      public function setType(param1:int) : void
      {
         var _loc2_:DisplayObject = null;
         if(param1 == NpcFunctionType.YUENAN_ZHONGQIU_LINGJIANG)
         {
            this.ft_chengji1.htmlText = LanResManager.getLanCommonTextWords("嫦娥");
            this.ft_tiaojian1.htmlText = LanResManager.getLanCommonTextWords("茶瓶") + "*8888";
            this.ft_jiangli1.htmlText = LanResManager.getLanCommonTextWords("嫦娥礼包*1（绑）");
            this.ft_chengji2.htmlText = LanResManager.getLanCommonTextWords("嫦娥送茶");
            this.ft_chengji2.htmlText = LanResManager.getLanCommonTextWords("茶瓶") + "*18888";
            this.ft_chengji2.htmlText = LanResManager.getLanCommonTextWords("送茶礼包*1（绑）");
            this.ft_chengji3.htmlText = LanResManager.getLanCommonTextWords("嫦娥望月");
            this.ft_tiaojian3.htmlText = LanResManager.getLanCommonTextWords("茶瓶") + "*28888";
            this.ft_jiangli3.htmlText = LanResManager.getLanCommonTextWords("望月礼包*1（绑）");
            this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/yn2014zhongqiu/bg.swf");
         }
         else if(param1 == NpcFunctionType.YUENAN_SANNIANJIANGLI)
         {
            this.ft_chengji1.htmlText = LanResManager.getLanCommonTextWords("第一");
            this.ft_tiaojian1.htmlText = LanResManager.getLanCommonTextWords("蜡烛") + "*8888";
            this.ft_jiangli1.htmlText = LanResManager.getLanCommonTextWords("精良蛋糕") + "*1（" + LanResManager.getLanCommonTextWords("绑定") + "）";
            this.ft_chengji2.htmlText = LanResManager.getLanCommonTextWords("第二");
            this.ft_tiaojian2.htmlText = LanResManager.getLanCommonTextWords("蜡烛") + "*18888";
            this.ft_jiangli2.htmlText = LanResManager.getLanCommonTextWords("极品蛋糕") + "*1（" + LanResManager.getLanCommonTextWords("绑定") + "）";
            this.ft_chengji3.htmlText = LanResManager.getLanCommonTextWords("第三");
            this.ft_tiaojian3.htmlText = LanResManager.getLanCommonTextWords("蜡烛") + "*28888";
            this.ft_jiangli3.htmlText = LanResManager.getLanCommonTextWords("三年蛋糕") + "*1（" + LanResManager.getLanCommonTextWords("绑定") + "）";
            this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynBirthday3/bg.swf");
         }
         else if(param1 == NpcFunctionType.YUENAN_CHRISTMAS_GIFT2)
         {
            this.ft_chengji1.htmlText = LanResManager.getLanCommonTextWords("初级");
            this.ft_tiaojian1.htmlText = LanResManager.getLanCommonTextWords("圣诞帽子") + "*8888";
            this.ft_jiangli1.htmlText = LanResManager.getLanCommonTextWords("圣诞礼包（初）") + "*1（" + LanResManager.getLanCommonTextWords("绑定") + "）";
            this.ft_chengji2.htmlText = LanResManager.getLanCommonTextWords("中级");
            this.ft_tiaojian2.htmlText = LanResManager.getLanCommonTextWords("圣诞帽子") + "*18888";
            this.ft_jiangli2.htmlText = LanResManager.getLanCommonTextWords("圣诞礼包（中）") + "*1（" + LanResManager.getLanCommonTextWords("绑定") + "）";
            this.ft_chengji3.htmlText = LanResManager.getLanCommonTextWords("高级");
            this.ft_tiaojian3.htmlText = LanResManager.getLanCommonTextWords("圣诞帽子") + "*28888";
            this.ft_jiangli3.htmlText = LanResManager.getLanCommonTextWords("圣诞礼包（高）") + "*1（" + LanResManager.getLanCommonTextWords("绑定") + "）";
            _loc2_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynChristmas/christmas.swf");
            _loc2_.x = 10;
            _loc2_.y = 2;
            addChild(_loc2_);
         }
      }
   }
}

