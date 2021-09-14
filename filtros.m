clear all
close all
imagen = imread('meme-pop-cat-pack.png');
r = imagen(:,:,1);
byn=mat2gray(r);
g = imagen(:,:,2);
b = imagen(:,:,3);

image(r)
image(g)
image(b)

h = [1,1,1;1,1,1;1,1,1];

[f,c] = size(r)

k = 3;

% h1=zeros(3,3);
h1=[h(1,1:end), h(2,1:end), h(3,1:end)];
%kernel
for i=length(h):f-length(h)+1:
    for j=length(h):c-length(h)+1:
        xr(k,:) = 255*[byn(i, j:j+2), byn(i+1, j:j+2), byn(i+2, j:j+2)];
        yr(k,:) = conv(xr(k,:), h1);
        ir(i, j) = yr(k, 10);
        k = k + 1;
    end
end

subplot(3, 1, 1)
imshow(byn)
subplot(3,1,2)
imshow(ir/max(max(ir)))
save('grupo1.mat', "ir")
