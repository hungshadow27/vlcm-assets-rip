package com.tgame.shell.view.components.jiujiexingtu
{
   import com.asQuery.$;
   import com.greensock.TweenLite;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import game.skin.JiuJieXingTuSkin;
   import game.utils.SkinTools;
   
   public class JiuJieXingTu_TaskView extends BasePanel
   {
      
      public var _parent:DisplayObject;
      
      private var taskDescArr:Array;
      
      private var openX:int = 753;
      
      private var closeX:int = 472;
      
      public function JiuJieXingTu_TaskView()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(JiuJieXingTuSkin.skin,"rongyushangcheng");
         this.taskDescArr = ["活跃度达到350","当天累计充值1元以上","完成一次拉镖任务","通关2次奇袭万兽阵副本","通关2次藏经阁副本","击杀10只世界BOSS"];
         $("rcfw",this,true).click(this.onClickHandler);
         $("lingquanniu",this,true).click(this.onClickHandler);
         $("tishi",this,true).attr("wordWrap",true);
         $("tishi",this,true).attr("text","1.快速完成副本不会计入日常任务中；" + "\n" + "2.完成任意3个任务后可领取神元宝箱；" + "\n" + "3.每人每天只可领取1次宝箱。");
         var _loc1_:Goods = new Goods(398475);
         var _loc2_:ItemFace = new ItemFace(_loc1_,65,65);
         _loc2_.x = 108;
         _loc2_.y = 297;
         addChild(_loc2_);
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         switch(param1.target.name)
         {
            case "rcfw":
               if(this.x == this.closeX)
               {
                  this._parent.dispatchEvent(new Event(JiuJieXingTuPanel.JIUJIEXINGTUPANEL_TASK_CLICK));
               }
               else
               {
                  TweenLite.to(this,0.5,{"x":this.closeX});
               }
               break;
            case "lingquanniu":
               this._parent.dispatchEvent(new Event(JiuJieXingTuPanel.JIUJIEXINGTUPANEL_LINGQU_CLICK));
         }
      }
      
      override protected function createVariableReference() : void
      {
      }
      
      public function setJiuJieXingTuTaskData(param1:Object) : void
      {
         if(this.x == this.closeX)
         {
            TweenLite.to(this,0.5,{"x":this.openX});
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < param1.arr.length)
         {
            $("richang" + (_loc3_ + 1),this,true).attr("text",this.taskDescArr[_loc3_] + "（" + param1.arr[_loc3_].currNum + "/" + param1.arr[_loc3_].maxNum + "）");
            if(param1.arr[_loc3_].currNum == param1.arr[_loc3_].maxNum)
            {
               _loc2_++;
            }
            _loc3_++;
         }
         if(!param1.isRecieved)
         {
            $("lingquanniu",this,true).attr("enabled",false);
         }
         else
         {
            $("lingquanniu",this,true).attr("enabled",_loc2_ == 3 ? true : false);
         }
      }
   }
}

