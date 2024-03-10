% Thiết lập thông số
SNR_dB = 0:5:30; % SNR từ 0 đến 30 dB
num_simulations = 10^5; % Số lần mô phỏng
R = 60; % Số lượng phần tử phản xạ của RIS

% Khởi tạo biến lưu kết quả
ergodic_rates = zeros(size(SNR_dB));

for snr_index = 1:length(SNR_dB)
    SNR = 10^(SNR_dB(snr_index) / 10); % Chuyển đổi SNR thành tỷ lệ tuyệt đối
    sum_ergodic_rate = 0;
    
    % Mô phỏng num_simulations lần
    for sim = 1:num_simulations
        % Mô phỏng kênh Rayleigh
        h1 = (randn(1) + 1i * randn(1)) / sqrt(2); % Hệ số kênh CT -> CR
        h2 = (randn(1) + 1i * randn(1)) / sqrt(2); % Hệ số kênh RiSc -> CR
        % Bổ sung các hệ số kênh khác tương tự
        
        % Tính tỷ lệ ergodic cho mỗi mô phỏng
        sum_h2_squared = 0;
        for r = 1:R
            sum_h2_squared = sum_h2_squared + abs((randn(1) + 1i * randn(1)) / sqrt(2))^2; % Hệ số kênh phản xạ RiSc -> CR
        end
        ergodic_rate = log2(1 + sum_h2_squared * SNR / (abs(h1)^2 + sum_h2_squared)); % Theo công thức ergodic rate
        
        sum_ergodic_rate = sum_ergodic_rate + ergodic_rate;
    end
    
    % Tính tỷ lệ ergodic trung bình cho mức SNR hiện tại
    ergodic_rates(snr_index) = sum_ergodic_rate / num_simulations;
end

% Vẽ đồ thị
figure;
plot(SNR_dB, ergodic_rates, 'b-*');
xlabel('SNR (dB)');
ylabel('Tỷ lệ Ergodic tại CR');
title('Mối quan hệ giữa Tỷ lệ Ergodic tại CR và SNR tại CT (R=60)');
grid on;

