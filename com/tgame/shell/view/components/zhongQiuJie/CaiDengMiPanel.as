package com.tgame.shell.view.components.zhongQiuJie
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.NoticeManager;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class CaiDengMiPanel extends FPanel
   {
      
      public static const UI_CAIDENGMI_OK_CLICK:String = "UI_CAIDENGMI_OK_CLICK";
      
      private var bg1:DisplayObject;
      
      private var ftaTitle:FTextArea;
      
      private var ftaRight:FTextArea;
      
      private var ftaWrong:FTextArea;
      
      private var ftaTime:FTextArea;
      
      private var ftaRank:FTextArea;
      
      private var check1:FCheckBox;
      
      private var check2:FCheckBox;
      
      private var check3:FCheckBox;
      
      private var check4:FCheckBox;
      
      private var answer1:FTextArea;
      
      private var answer2:FTextArea;
      
      private var answer3:FTextArea;
      
      private var answer4:FTextArea;
      
      private var ljBtn:SecondButton;
      
      private var okBtn:SecondButton;
      
      private var nextBtn:SecondButton;
      
      private var titleIndex:int = 0;
      
      private var rightAnswer:int = 0;
      
      private var next:String;
      
      public function CaiDengMiPanel()
      {
         super();
         this.titleText = LanResManager.getLanCommonTextWords("猜灯谜");
         this.showCloseButton = true;
         this.skin = "panel";
         this.dragAble = true;
         width = 261;
         height = 330;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/yuanXiaoJie/dengMi.swf");
         this.bg1.x = 12;
         this.bg1.y = 2;
         addChild(this.bg1);
         this.ftaTitle = new FTextArea();
         this.ftaTitle.text = "";
         this.ftaTitle.textColor = StaticValue.BlUE20;
         this.ftaTitle.filters = StaticValue.filter;
         this.ftaTitle.x = 20;
         this.ftaTitle.y = 20;
         this.ftaTitle.width = 210;
         this.ftaTitle.height = 80;
         this.ftaTitle.wordWrap = true;
         addChild(this.ftaTitle);
         this.ftaRight = new FTextArea();
         this.ftaRight.text = LanResManager.getLanCommonTextWords("答对题数：");
         this.ftaRight.textColor = StaticValue.BlUE20;
         this.ftaRight.filters = StaticValue.filter;
         this.ftaRight.x = 30;
         this.ftaRight.y = 100;
         this.ftaRight.width = 200;
         addChild(this.ftaRight);
         this.ftaWrong = new FTextArea();
         this.ftaWrong.text = LanResManager.getLanCommonTextWords("答错题数：");
         this.ftaWrong.textColor = StaticValue.BlUE20;
         this.ftaWrong.filters = StaticValue.filter;
         this.ftaWrong.x = 30;
         this.ftaWrong.y = 120;
         this.ftaWrong.width = 200;
         addChild(this.ftaWrong);
         this.ftaRank = new FTextArea();
         this.ftaRank.text = LanResManager.getLanCommonTextWords("排名：");
         this.ftaRank.textColor = StaticValue.BlUE20;
         this.ftaRank.filters = StaticValue.filter;
         this.ftaRank.x = 15;
         this.ftaRank.y = 90;
         this.ljBtn = new SecondButton();
         this.ljBtn.label = LanResManager.getLanCommonTextWords("领奖");
         this.ljBtn.x = 25;
         this.ljBtn.y = 90;
         this.check1 = new FCheckBox();
         addChild(this.check1);
         this.check1.x = 30;
         this.check1.y = 160;
         this.check1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.answer1 = new FTextArea();
         this.answer1.text = "";
         this.answer1.textColor = StaticValue.BlUE20;
         this.answer1.filters = StaticValue.filter;
         this.answer1.x = this.check1.x + 20;
         this.answer1.y = this.check1.y;
         this.answer1.width = 190;
         addChild(this.answer1);
         this.check2 = new FCheckBox();
         addChild(this.check2);
         this.check2.x = this.check1.x;
         this.check2.y = this.check1.y + 20;
         this.check2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.answer2 = new FTextArea();
         this.answer2.text = "";
         this.answer2.textColor = StaticValue.BlUE20;
         this.answer2.filters = StaticValue.filter;
         this.answer2.x = this.check1.x + 20;
         this.answer2.y = this.check2.y;
         this.answer2.width = 190;
         addChild(this.answer2);
         this.check3 = new FCheckBox();
         addChild(this.check3);
         this.check3.x = this.check1.x;
         this.check3.y = this.check2.y + 20;
         this.check3.addEventListener(MouseEvent.CLICK,this.onClick);
         this.answer3 = new FTextArea();
         this.answer3.text = "";
         this.answer3.textColor = StaticValue.BlUE20;
         this.answer3.filters = StaticValue.filter;
         this.answer3.x = this.check1.x + 20;
         this.answer3.y = this.check3.y;
         this.answer3.width = 190;
         addChild(this.answer3);
         this.check4 = new FCheckBox();
         addChild(this.check4);
         this.check4.x = this.check1.x;
         this.check4.y = this.check3.y + 20;
         this.check4.addEventListener(MouseEvent.CLICK,this.onClick);
         this.answer4 = new FTextArea();
         this.answer4.text = "";
         this.answer4.textColor = StaticValue.BlUE20;
         this.answer4.filters = StaticValue.filter;
         this.answer4.x = this.check1.x + 20;
         this.answer4.y = this.check4.y;
         this.answer4.width = 190;
         addChild(this.answer4);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         this.okBtn.x = 30;
         this.okBtn.y = 260;
         this.okBtn.enabled = false;
         addChild(this.okBtn);
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextBtn = new SecondButton();
         this.nextBtn.label = LanResManager.getLanCommonTextWords("下一题");
         this.nextBtn.x = 150;
         this.nextBtn.y = 260;
         addChild(this.nextBtn);
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
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
         var _loc2_:Array = null;
         switch(param1.target)
         {
            case this.check1:
               this.check1.selectState = true;
               this.check2.selectState = false;
               this.check3.selectState = false;
               this.check4.selectState = false;
               this.okBtn.enabled = true;
               break;
            case this.check2:
               this.check1.selectState = false;
               this.check2.selectState = true;
               this.check3.selectState = false;
               this.check4.selectState = false;
               this.okBtn.enabled = true;
               break;
            case this.check3:
               this.check1.selectState = false;
               this.check2.selectState = false;
               this.check3.selectState = true;
               this.check4.selectState = false;
               this.okBtn.enabled = true;
               break;
            case this.check4:
               this.check1.selectState = false;
               this.check2.selectState = false;
               this.check3.selectState = false;
               this.check4.selectState = true;
               this.okBtn.enabled = true;
               break;
            case this.ljBtn:
               break;
            case this.okBtn:
               if(!this.check1.selectState || !this.check2.selectState || !this.check3.selectState || !this.check4.selectState)
               {
                  if(this.check1.selectState)
                  {
                     dispatchEvent(new BaseEvent(UI_CAIDENGMI_OK_CLICK,"",[this.titleIndex,1]));
                  }
                  else if(this.check2.selectState)
                  {
                     dispatchEvent(new BaseEvent(UI_CAIDENGMI_OK_CLICK,"",[this.titleIndex,2]));
                  }
                  else if(this.check3.selectState)
                  {
                     dispatchEvent(new BaseEvent(UI_CAIDENGMI_OK_CLICK,"",[this.titleIndex,3]));
                  }
                  else if(this.check4.selectState)
                  {
                     dispatchEvent(new BaseEvent(UI_CAIDENGMI_OK_CLICK,"",[this.titleIndex,4]));
                  }
               }
               break;
            case this.nextBtn:
               if(this.next != "")
               {
                  _loc2_ = this.next.split(",");
                  MainCharSeachPathManager.mainCharWalk(_loc2_[0] + "," + _loc2_[1] + "," + _loc2_[2] + ",70");
                  this.onClose();
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("答题完毕"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("答题完毕"));
               }
         }
      }
      
      public function setDatas(param1:int, param2:String, param3:int, param4:int, param5:int, param6:int, param7:String, param8:String) : void
      {
         this.next = param8;
         this.titleIndex = param1;
         this.ftaTitle.htmlText = param2;
         this.ftaRight.text = LanResManager.getLanCommonTextWords("答对题数：") + param3;
         this.ftaWrong.text = LanResManager.getLanCommonTextWords("答错题数：") + param4;
         var _loc9_:Array = param7.split(";");
         this.answer1.text = _loc9_[0];
         this.answer2.text = _loc9_[1];
         this.answer3.text = _loc9_[2];
         this.answer4.text = _loc9_[3];
         var _loc10_:int = 1;
         while(_loc10_ < 5)
         {
            if(_loc10_ == param6)
            {
               this["check" + _loc10_].selectState = true;
            }
            else
            {
               this["check" + _loc10_].selectState = false;
            }
            this["answer" + _loc10_].textColor = StaticValue.BlUE20;
            _loc10_++;
         }
         if(param6 > 0)
         {
            this["answer" + param6].textColor = StaticValue.RED;
            this["answer" + param5].textColor = StaticValue.GREEN;
         }
      }
   }
}

