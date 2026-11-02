package com.tgame.moudels.xunzhangduanzao.controller
{
   import com.tgame.moudels.xunzhangduanzao.model.XunZhangDuanZao_MsgReceivedProxy;
   import com.tgame.moudels.xunzhangduanzao.model.XunZhangDuanZao_MsgSenderProxy;
   import com.tgame.moudels.xunzhangduanzao.view.JinHua_PlaneMediator;
   import com.tgame.moudels.xunzhangduanzao.view.QiangHua_PlaneMediator;
   import com.tgame.moudels.xunzhangduanzao.view.ShengDanXunZhangDuanZao_PlaneMediator;
   import com.tgame.moudels.xunzhangduanzao.view.XunZhangDuanZao_PlaneMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class XunZhangDuanZao_StartupCommand extends SimpleCommand
   {
      
      public function XunZhangDuanZao_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new XunZhangDuanZao_MsgReceivedProxy());
         facade.registerProxy(new XunZhangDuanZao_MsgSenderProxy());
         facade.registerMediator(new XunZhangDuanZao_PlaneMediator());
         facade.registerMediator(new ShengDanXunZhangDuanZao_PlaneMediator());
         facade.registerMediator(new QiangHua_PlaneMediator());
         facade.registerMediator(new JinHua_PlaneMediator());
      }
   }
}

