function draw_myrobot(q_in)
% FK=simplify(Rz(q1)*Tx(q2)*Tx(L2))

  L2 = 0.2;d2 = 0.1;
q1 = q_in(:,1);
q2 = q_in(:,2);
 

 
hold on

grid on
xlim([-3 3])
ylim([-7 7])
 
view([0 -90])
axis equal
title('RP Robot')
T1=Rz(q1);
plot3(0,0,0,'ro','MarkerSize',2,'LineWidth', 2);
plot3([0 T1(1,4)],[0 T1(2,4)],[0 T1(3,4)],'-b','LineWidth', 5);
plot3(T1(1,4),T1(2,4),T1(3,4),'ro','MarkerSize',2,'LineWidth', 2);

T2=Rz(q1)*Tx(q2)*Tx(L2);
plot3([T1(1,4) T2(1,4)],[T1(2,4) T2(2,4)],[T1(3,4) T2(3,4)],'-b','LineWidth', 5);
plot3(T2(1,4),T2(2,4),T2(3,4),'ro','MarkerSize',2,'LineWidth', 2);

 
T4x=Rz(q1)*Tx(q2)*Tx(L2)*Tx(0.002);
quiver3(T2(1,4),T2(2,4),T2(3,4),T4x(1,4)-T2(1,4),T4x(2,4)-T2(2,4),T4x(3,4)-T2(3,4),0,'-p')
T4y=Rz(q1)*Tx(q2)*Tx(L2)*Ty(0.002);
quiver3(T2(1,4),T2(2,4),T2(3,4),T4y(1,4)-T2(1,4),T4y(2,4)-T2(2,4),T4y(3,4)-T2(3,4),0,'-c')
T4z=Rz(q1)*Tx(q2)*Tx(L2)*Tz(0.002);
quiver3(T2(1,4),T2(2,4),T2(3,4),T4z(1,4)-T2(1,4),T4z(2,4)-T2(2,4),T4z(3,4)-T2(3,4),0,'-g')


