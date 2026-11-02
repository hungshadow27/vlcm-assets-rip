package com.tgame.shell.view.components.mainui
{
   import com.fireice.button.FSimpleButton;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import gs.TweenMax;
   
   public class GuideBar extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var btnArr:Array = [];
      
      private var qianBtn:FSimpleButton;
      
      private var skillBtn:FSimpleButton;
      
      private var jiangBtn:FSimpleButton;
      
      private var box1:MovieClip;
      
      private var box2:MovieClip;
      
      private var box3:MovieClip;
      
      public function GuideBar()
      {
         super();
      }
      
      public function addBtn(param1:int, param2:int = -1) : void
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc5_:MovieClip = null;
         var _loc6_:int = 0;
         _loc3_ = String(param1);
         if(this.btnArr.indexOf(_loc3_) != -1 && param2 == -1)
         {
            return;
         }
         _loc4_ = GameInstance.uiInstance.charAttribute.getShowBiaoqiang(param2);
         if(param2 != -1)
         {
            if(_loc4_.length > 0)
            {
               _loc6_ = 0;
               while(_loc6_ < _loc4_.length)
               {
                  if(this.btnArr.indexOf(String(_loc4_[_loc6_][0]) + "," + String(_loc4_[_loc6_][1])) == -1)
                  {
                     this.box1 = new MovieClip();
                     this.qianBtn = new FSimpleButton();
                     this.qianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
                     this.qianBtn.x = 5;
                     this.qianBtn.y = 5;
                     this.qianBtn.width = 25;
                     this.qianBtn.height = 25;
                     this.qianBtn.name = String(_loc4_[_loc6_][0]) + "," + String(_loc4_[_loc6_][1]);
                     this.box1.addChild(this.qianBtn);
                     _loc5_ = StaticValue.getMCByClassName("ui.main.btn.texiao.mc") as MovieClip;
                     _loc5_.mouseEnabled = false;
                     this.box1.addChild(_loc5_);
                     this.box1.name = String(_loc4_[_loc6_][0]) + "," + String(_loc4_[_loc6_][1]);
                     addChild(this.box1);
                     this.box1.x = 300;
                     this.btnArr.push(String(_loc4_[_loc6_][0]) + "," + String(_loc4_[_loc6_][1]));
                     this.qianBtn.skin = "MainJieButton";
                     this.qianBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("你的") + "【" + String(_loc4_[_loc6_][2]) + "】" + LanResManager.getLanCommonTextWords("可解封") + "</font>";
                  }
                  _loc6_++;
               }
            }
         }
         else
         {
            this.box1 = new MovieClip();
            this.qianBtn = new FSimpleButton();
            this.qianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            this.qianBtn.x = 5;
            this.qianBtn.y = 5;
            this.qianBtn.width = 25;
            this.qianBtn.height = 25;
            this.qianBtn.name = _loc3_;
            this.box1.addChild(this.qianBtn);
            _loc5_ = StaticValue.getMCByClassName("ui.main.btn.texiao.mc") as MovieClip;
            _loc5_.mouseEnabled = false;
            this.box1.addChild(_loc5_);
            this.box1.name = _loc3_;
            addChild(this.box1);
            this.box1.x = 300;
            this.btnArr.push(_loc3_);
            switch(param1)
            {
               case MainUI.IMAGE_LEAD_TYPE_POINT:
                  this.qianBtn.skin = "MainQianButton";
                  this.qianBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("你有新的潜能点可支配。") + "</font>";
                  break;
               case MainUI.IMAGE_LEAD_TYPE_KUNGFU_LV:
                  this.qianBtn.skin = "MainJiButton";
                  this.qianBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("你有武功可以升级。") + "</font>";
                  break;
               case MainUI.LEIJI_DENGLU_JIANGLI:
                  this.qianBtn.skin = "MainJiangButton";
                  this.qianBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("你有《傲剑》登陆大奖可以领取。") + "</font>";
                  break;
               case MainUI.IMAGE_LEAD_TYPE_CISHA:
                  this.qianBtn.skin = "MainCiButton";
                  this.qianBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("你顺利完成刺杀任务，奖励不要忘记领取，点击领取！") + "</font>";
                  break;
               case MainUI.IMAGE_LEAD_TYPE_FUCHOU:
                  this.qianBtn.skin = "MainFuButton";
                  this.qianBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("你手刃了仇人，奖励不要忘记领取，点击领取！") + "</font>";
                  break;
               case MainUI.IMAGE_LEAD_TYPE_GIRL_XINQING_LOW:
                  this.qianBtn.skin = "MainShiButton";
                  this.qianBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您有侍从心情值过低") + "</font>";
                  break;
               case MainUI.IMAGE_LEAD_TYPE_WANGZHEZHIBANG:
                  this.qianBtn.skin = "MainPartyButton";
                  this.qianBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击领取王者之帮奖励") + "</font>";
            }
         }
         this.resetButton();
      }
      
      private function resetButton() : void
      {
         var _loc3_:MovieClip = null;
         var _loc4_:int = 0;
         var _loc1_:int = int(this.btnArr.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = getChildByName(this.btnArr[_loc2_]) as MovieClip;
            _loc4_ = 45 * _loc2_;
            TweenMax.to(_loc3_,5,{"x":_loc4_});
            _loc2_++;
         }
      }
      
      public function removeAllBtn() : void
      {
         while(this.numChildren != 0)
         {
            this.removeChildAt(0);
         }
         this.btnArr.length = 0;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc6_:String = null;
         var _loc2_:String = param1.currentTarget.name;
         var _loc3_:int = 0;
         while(_loc3_ < this.btnArr.length)
         {
            if(this.btnArr[_loc3_] == _loc2_)
            {
               this.btnArr.splice(_loc3_,1);
            }
            _loc3_++;
         }
         removeChild(param1.target.parent as MovieClip);
         var _loc4_:Array = _loc2_.split(",");
         var _loc5_:int = int(_loc2_);
         if(_loc4_.length == 2)
         {
            if(Fun.isVisible(GameInstance.uiInstance.charAttribute))
            {
               GameInstance.uiInstance.charAttribute.setShowBiaoqian(int(_loc4_[0]),int(_loc4_[1]));
               GameInstance.uiInstance.charAttribute.initCharPanel(int(_loc4_[0]),String(_loc4_[1]));
            }
            else
            {
               this.$parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_QIANLIDIAN_GUIDE));
               GameInstance.uiInstance.charAttribute.setShowBiaoqian(int(_loc4_[0]),int(_loc4_[1]));
               GameInstance.uiInstance.charAttribute.initCharPanel(int(_loc4_[0]),String(_loc4_[1]));
            }
            _loc6_ = GameInstance.uiInstance.charAttribute.getBiaoqianLabel(int(_loc4_[0]),int(_loc4_[1]));
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("你已解封") + _loc6_);
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("你已解封") + _loc6_);
         }
         else if(_loc4_.length == 1)
         {
            switch(_loc5_)
            {
               case MainUI.IMAGE_LEAD_TYPE_POINT:
                  if(Fun.isVisible(GameInstance.uiInstance.charAttribute))
                  {
                     GameInstance.uiInstance.charAttribute.showChar();
                  }
                  else
                  {
                     this.$parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_QIANLIDIAN_GUIDE));
                  }
                  break;
               case MainUI.IMAGE_LEAD_TYPE_KUNGFU_LV:
                  if(!Fun.isVisible(GameInstance.uiInstance.kungFuPanel))
                  {
                     this.$parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_JINENG_GUIDE));
                  }
                  break;
               case MainUI.LEIJI_DENGLU_JIANGLI:
                  this.$parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_JIANG_GUIDE));
                  break;
               case MainUI.IMAGE_LEAD_TYPE_CISHA:
                  this.$parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_CISHA_GUIDE));
                  break;
               case MainUI.IMAGE_LEAD_TYPE_FUCHOU:
                  this.$parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_FUCHOU_GUIDE));
                  break;
               case MainUI.IMAGE_LEAD_TYPE_GIRL_XINQING_LOW:
                  if(!Fun.isVisible(GameInstance.uiInstance._meiren))
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_MEIREN_PANEL,-1);
                  }
                  break;
               case MainUI.IMAGE_LEAD_TYPE_WANGZHEZHIBANG:
                  if(!Fun.isVisible(GameInstance.uiInstance._wangzhezhibangLingjiangPanel))
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_WANGZHEZHIBANG_LINGJIANG_PANEL);
                  }
            }
         }
         this.resetButton();
      }
   }
}

